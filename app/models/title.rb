class Title < ActiveRecord::Base
  belongs_to :university
  belongs_to :user

  enum level: [:licenciatura,
               :especialidad,
               :sub_especialidad,
               :maestría,
               :doctorado,
               :pos_doctorado,
               :educación_continua
              ]

  validates_associated :user
  validates_associated :university

  accepts_nested_attributes_for :user, :university
end
