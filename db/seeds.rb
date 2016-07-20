# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
30.times do
  uni = University.new
  uni.name = Faker::University.name
  uni.level = University.levels.map { |s| s[0] }.sample
  uni.save
end
  50.times do
    u = User.new
    u.name =  Faker::Name.first_name
    u.last_name = Faker::Name.last_name
    u.email =  u.last_name+'.'+u.name+'@'+Faker::Internet.domain_name
    u.password= 'password1234'
    u.password_confirmation = 'password1234'
    u.role = 'especialista'
    University.levels.each do |level|
      uni = University.where(level: level[1]).order('RANDOM()').limit(1)
    end
    u.universities<<uni


    u.save
    10.times do
      d = Document.new
      d.user_id = u.id
      d.certificate = Document.certificates.map { |s| s[0]  }.sample
      d.description = Faker::Lorem.words(20)
      d.emission_date = Time.now
      #d.image = File.new('/public/images/document_icon_default.png')
      d.save
    end
  end
30.times do
  uni = University.new
  uni.name = Faker::University.name
  uni.level = University.levels.map { |s| s[0] }.sample
  uni.save
  u.universities<<uni
end
uni = University.create(name: 'Facultad de Medicina, Universidad de Guadalajara')
uni = University.create(name: 'Facultad de Medicina Ignacio Chávez, Universidad Michoacana de San Nicolás de Hidalgo')
uni = University.create(name: 'Facultad de Medicina, Benemérita Universidad Autónoma de Puebla')
uni = University.create(name: 'Facultad de Medicina, Universidad Autónoma de Yucatán')
uni = University.create(name: 'Facultad de Medicina, Universidad Nacional Autónoma de México')
uni = University.create(name: 'Facultad de Medicina, Universidad Autónoma de Nuevo León')
uni = University.create(name: 'Facultad de Medicina, Universidad Autónoma de San Luis Potosí')
uni = University.create(name: 'Escuela Nacional de Medicina y Homeopatía, Instituto Politécnico Nacional')
uni = University.create(name: 'Escuela Libre de Homeopatía, SEP')
uni = University.create(name: 'Escuela Médico Militar, Universidad del Ejercito y Fuerza Aérea')
uni = University.create(name: 'Facultad de Medicina, Universidad Autónoma de Guadalajara')
uni = University.create(name: 'Escuela Superior de Medicina, Instituto Politécnico Nacional')
uni = University.create(name: 'Facultad de Medicina de León, Universidad de Guanajuato')
uni = University.create(name: 'Facultad de Medicina, Universidad Autónoma del Estado de Hidalgo')
uni = University.create(name: 'Facultad de Medicina, Universidad Autónoma de Benito Júarez de Oaxaca')
uni = University.create(name: 'Facultad de Medicina, Universidad Autónoma de Tamaulipas Unidad Tampico')
uni = University.create(name: 'Facultad de Medicina, Universidad Veracruzana Unidad Veracruz')
uni = University.create(name: 'Facultad de Medicina, Universidad Autónoma de Chihuahua')
uni = University.create(name: 'Facultad de Medicina, Universidad Autónoma del Estado de México')
uni = University.create(name: 'Facultad de Medicina, Universidad Juárez del Estado de Durango Unidad Durango')
uni = University.create(name: 'Facultad de Medicina, Universidad Autónoma de Coahuila Unidad Torreón')
uni = University.create(name: 'Carrera de Medicina, Universidad Juárez Autónoma de Tabasco')
uni = University.create(name: 'Escuela de Medicina, Universidad Autónoma de Zacatecas')
uni = University.create(name: 'División de Ciencias de la Salud, Universidad de Monterrey')
uni = University.create(name: 'Facultad Mexicana de Medicina, Universidad La Salle')
uni = University.create(name: 'Escuela de Medicina José Sierra Flores, Universidad del Noreste, A.C.')
uni = University.create(name: 'Escuela de Medicina, Universidad Autónoma de Baja California Unidad Mexicali')
uni = University.create(name: 'Facultad de Medicina, Universidad Veracruzana Unidad Poza Rica')
uni = University.create(name: 'Facultad de Medicina, Universidad Autónoma de Tamaulipas Unidad Matamoros')
uni = University.create(name: 'Centro de Ciencias Biomédicas de la Universidad Autónoma de Aguascalientes')
uni = University.create(name: 'Facultad de Medicina, Universidad Popular Autónoma del Estado de Puebla')
uni = University.create(name: 'Escuela de Medicina, Universidad Autónoma de Ciudad Juárez')
uni = University.create(name: 'Ciudad Juárez, Chihuahua')
uni = University.create(name: 'Facultad de Medicina, Universidad Veracruzana Unidad Ciudad Mendoza')
uni = University.create(name: 'Escuela de Medicina, Centro de Estudios Universitarios Xochicalco')
uni = University.create(name: 'Carrera de Medicina, Universidad Autónoma Metropolitana Plantel Xochimilco')
uni = University.create(name: 'Escuela de Medicina, Universidad Autónoma de Coahuila Unidad Saltillo')
uni = University.create(name: 'Facultad de Medicina, Universidad Autónoma de Nayarit')
uni = University.create(name: 'Facultad de Medicina, Universidad Autónoma de Baja California Unidad Tijuana')
uni = University.create(name: 'Facultad de Medicina, Universidad Autónoma de Guerrero')
uni = University.create(name: 'Facultad de Medicina, Universidad Veracruzana Unidad Xalapa')
uni = University.create(name: 'Escuela de Medicina, Universidad Anáhuac')
uni = University.create(name: 'Escuela de Medicina, Universidad Autónoma del Estado de Morelos')
uni = University.create(name: 'Centro Interdisciplinario de Ciencias de la Salud, Carrera de Medicina, Instituto Politécnico Nacional')
uni = University.create(name: 'Facultad de Estudios Superiores Zaragoza, Carrera de Medicina, Universidad Nacional Autónoma de México')
uni = University.create(name: 'Escuela Nacional de Estudios Profesionales Iztacala, Carrera de Medicina, Universidad Nacional Autónoma de Mexico')
uni = University.create(name: 'Carrera de Medicina, Universidad de Montemorelos')
uni = University.create(name: 'Facultad de Medicina, Universidad Autónoma de Chiapas')
uni = University.create(name: 'Facultad de Medicina, Universidad Juárez del Estado de Durango Unidad Gómez Palacio')
uni = University.create(name: 'Facultad de Medicina, Universidad Veracruzana Unidad Minatitlán')
uni = University.create(name: 'Facultad de Medicina, Universidad Autónoma de Campeche')
uni = University.create(name: 'Facultad de Medicina, Universidad de Colima')
uni = University.create(name: 'Escuela de Medicina, Universidad Autónoma de Sinaloa')
uni = University.create(name: 'Escuela de Medicina y Cirugía, Universidad Regional del Sureste')
uni = University.create(name: 'Escuela de Medicina Ignacio A. Santos Instituto Tecnológico de Estudios Superiores de Monterrey')
uni = University.create(name: 'Facultad de Medicina, Universidad Autónoma de Querétaro')
uni = University.create(name: 'Facultad de Medicina, Universidad Valle de Bravo Campus Ciudad Reynosa')
uni = University.create(name: 'Facultad de Medicina, Universidad Valle de Bravo Campus Ciudad Victoria')
uni = University.create(name: 'Escuela Médico Naval, Secretaría de Marina')
uni = University.create(name: 'Escuela de Medicina, Universidad México Americana del Norte')
uni = University.create(name: 'Escuela de Medicina Tominaga Nakamoto')
uni = University.create(name: 'Instituto de Estudios Superiores de Chiapas, Universidad Salazar Campus Tuxtla Gutiérrez')
uni = University.create(name: 'Escuela de Medicina, Universidad Autónoma de Tlaxcala')
uni = University.create(name: 'Centro Universitario Xochicalco, Campus Tijuana')
uni = University.create(name: 'Escuela de Medicina, Universidad Panamericana')
uni = University.create(name: 'Escuela de Medicina, Centro Cultural Universidad Justo Sierra')
uni = University.create(name: 'Área de Ciencias de la Salud, Universidad del Valle de México Campus Querétaro')
uni = University.create(name: 'Instituto de Estudios Superiores de Chiapas, Universidad Salazar Campus Tapachula')
uni = University.create(name: 'Facultad de Medicina, Universidad Autónoma de Veracruz Villa Rica')
uni = University.create(name: 'Escuela de Medicina, Universidad Quetzalcoatl')
uni = University.create(name: 'Escuela de Medicina Don Santiago Ramón y Cajal')
uni = University.create(name: 'Escuela de Medicina, Universidad Westhill')
uni = University.create(name: 'Escuela de Medicina, Universidad Anáhuac Mayab, S.C.')
uni = University.create(name: 'Escuela de Medicina, Universidad Sonora')
uni = University.create(name: 'Centro Universitario del Sur, Universidad de Guadalajara')
uni = University.create(name: 'Carrera de Medicina, Universidad Guadalajara Lamar')
uni = University.create(name: 'Escuela de Medicina, Universidad Latinoamericana, S.C.')
uni = University.create(name: 'Carrera de Medicina, Universidad Cristóbal Colon')
