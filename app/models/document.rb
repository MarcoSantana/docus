class Document < ActiveRecord::Base
  belongs_to :user
  #has_paper_trail



  enum status:  [:por_revisar,
                :por_corregir,
                :rechazado,
                :aceptado]



  enum type: [:PersonalDocument,
              :formación_profesional,
              :constancia_de_actividad,
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


end
