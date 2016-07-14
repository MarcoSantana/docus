class University < ActiveRecord::Base

  has_many :titles
  has_many :users, through: :titles
  # TODO:  has_many :academic_activity_documents

  enum level: [:licenciatura, :especialidad, :sub_especialidad, :maestría, :doctorado, :pos_doctorado, :educación_continua]
  University.eager_load(:titles)
  accepts_nested_attributes_for :users

  has_attached_file :logo, styles: { large: "500x500", medium: "300x300>", thumb: "100x100>", icon:"32x32" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
end
