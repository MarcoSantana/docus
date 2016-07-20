class AcademicActivityDocument < Document

 has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: '/images/document_icon_default.png'

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_presence_of :image
  validates_presence_of :description
  validates_presence_of :from
  validates_presence_of :to
  validate :date_cannot_be_in_the_future
  validate :to_cannot_be_before_from

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

##



  enum description:{Profesor_de_Pregrado: 3,
                    Profesor_de_Especialidad: 4 ,
                    Profesor_de_Posgrado: 5,
                    Asesor_de_Tesis: 6,
                    Jefe_de_Enseñanza: 7}
  def to_s
    type.to_s
  end

  def status_data
    @status_data
  end
end
