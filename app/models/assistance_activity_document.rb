class AssistanceActivityDocument < Document

 has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: '/images/document_icon_default.png'

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_presence_of :image
  validates_presence_of :description
  validates_presence_of :from
  validates_presence_of :to
  validate :date_cannot_be_in_the_future
  validate :to_cannot_be_before_from



##Enum for the kinds of asistace activity document

  enum description:{Médico_Adscrito_En_Hospital: 8,
                    Jefe_de_Departamento: 9,
                    Médico_Adscrito_En_Departamento: 10}
  def to_s
    type.to_s
  end

  def status_data
    @status_data
  end
end
