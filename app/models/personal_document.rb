class PersonalDocument < Document
  belongs_to :user
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: '/images/document_icon_default.png'

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_presence_of :image
  validates :description, presence: true


  enum description:{Acta_De_Nacimiento: 0 ,
                    CURP: 1,
                    Identificación_Oficial: 2}
  def to_s
    type.to_s
  end

  def status_data
    @status_data
  end

end
