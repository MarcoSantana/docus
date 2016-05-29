class Entity < ActiveRecord::Base

  #enum type: [:universidad, :colegio_de_especialidad, :instituto, :otro ]
  enum level: [:licenciatura, :especialidad, :sub_especialidad, :maestría, :doctorado, :pos_doctorado, :educación_continua]

  def name_with_level
    "#{name}: #{level.humanize}"
  end
end
