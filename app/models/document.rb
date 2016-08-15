class Document < ActiveRecord::Base
  require 'action_view'
  include ActionView::Helpers::DateHelper
  # Creo que esto daña el rendimiento
  belongs_to :user
  has_and_belongs_to_many :issuers

  #has_paper_trail



  enum status:  [:por_revisar,
                :por_corregir,
                :rechazado,
                :aceptado]



  enum type: [:PersonalDocument,
              :AcademicActivityDocument,
              :AssistanceActivityDocument,
              :evento,
              :publicación
             ]


  #Scopes
  scope :contemporary,  -> { where(["documents.to >= ?", 5.years.ago]) }
  scope :stale, -> { where(["documents.to < ?", 5.years.ago]) }


  #Métodos
  def to_s
    type.to_s.humanize
  end

  def status_style
    case status
      when 'por_revisar'
        'info'
      when 'por_corregir'
        'warning'
      when 'rechazado'
        'danger'
      when 'aceptado'
        'success'
    end
  end

  def duration
    (((self.to - self.from))/365.0).round
  end

  def period
    distance_of_time_in_words self.from, self.to
  end

  def calculated_value
    doc_val = Value[description]['pts_year'] * duration
    max_years = Value[description]['max_years'] * duration
    pts_year = Value[description]['pts_year'] * duration

    if duration > max_years
      return max_years * pts_year
    end

    return doc_val
  end

  def validity?
    if (self.duration > 5) || (self.duration < 1) || ( self.to < 5.years.ago)
      return false
    else
      return true
    end
  end


  #Ransackers

  # ransacker :stale do
  #   # Model.where('extract(year  from date_column) = ?', desired_year)
  #
  #   Document.where('documents.to < ?', 5.years.ago)
  # end
  ransacker :old do
    Document.stale
  end

  # `ransackable_scopes` by default returns an empty array
  # i.e. no class methods/scopes are authorized.
  # For overriding with a whitelist array of *symbols*.
  #
  # def ransackable_scopes(auth_object = nil)
  #   stale: 'true'
  # end
  class << self
    def ransackable_scopes(auth_object = nil)
      %w(sorted stale)
      %w(sorted contemporary)
    end
  end


  ##Validations
  #Evita poner fechas sin sentido
  def date_cannot_be_in_the_future
   if from.present? && from.future?
     errors.add(:from, 'no puede ser en el futuro')
   end
  end
  #Evita poner fechas sin sentido
  def to_cannot_be_before_from
    if from.present? && to.present? && to < from
      errors.add(:to, "no puede ser antes del inicio")
    end
  end


end
