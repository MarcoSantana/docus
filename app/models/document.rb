class Document < ActiveRecord::Base

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

  def age
    (((self.to - self.from))/365.0).round
  end

  def calculated_value
    doc_val = Value[description]['pts_year'] * age
    max_years = Value[description]['max_years'] * age
    pts_year = Value[description]['pts_year'] * age

    if age > max_years
      return max_years * pts_year
    end

    return doc_val
  end

  ##Validations
  #Evita poner fechas sin sentido
  def date_cannot_be_in_the_future
   if from.present? && from.future?
     errors.add(:from, "no puede ser en el futuro")
   end
  end
  #Evita poner fechas sin sentido
  def to_cannot_be_before_from
    if from.present? && to.present? && to < from
      errors.add(:to, "no puede ser antes del inicio")
    end
  end


end
