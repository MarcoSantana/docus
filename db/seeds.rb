# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  500.times do |i|
    u = User.new
    u.name =  Faker::Name.first_name
    u.last_name = Faker::Name.last_name
    u.email =  u.last_name+'.'+u.name+'@'+Faker::Internet.domain_name
    u.password= 'password1234'
    u.password_confirmation = 'password1234'
    u.role = 'especialista'

    u.save
    100.times do |j|
      d = Document.new
      d.user_id = u.id
      d.certificate = Document.certificates.map { |s| s[0]  }.sample
      d.description = Faker::Lorem.paragraphs
      d.emission_date = Time.now
      #link = UiFaces.face
      #d.image = File.new(link)
    end
  end
