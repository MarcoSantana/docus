class Document < ActiveRecord::Base
  belongs_to :user
  #has_paper_trail
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  enum certificate: [ :curso, :impartir_clase, :ejercer_medicina, :asociado_al_consejo, :impatir_seminario, :asistir_seminario, :publicacion ]
  validates :certificate, presence: true
  validates :emission_date, presence: true

  def to_s
    certificate.humanize
  end


end
