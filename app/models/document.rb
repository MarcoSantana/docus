class Document < ActiveRecord::Base
  belongs_to :user
  #has_paper_trail
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: '/images/document_icon_default.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  enum certificate: [ :educación_contínua, :docencia, :profesor_titular, :ejercicio_de_la_especialidad, :membresía, :impatir_seminario, :asistir_seminario, :investigación, :profesor_asociado, :personal, :formación_profesional ]
  validates :certificate, presence: true
  validates :emission_date, presence: true

  def to_s
    certificate.humanize
  end


end
