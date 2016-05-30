# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  50.times do
    u = User.new
    u.name =  Faker::Name.first_name
    u.last_name = Faker::Name.last_name
    u.email =  u.last_name+'.'+u.name+'@'+Faker::Internet.domain_name
    u.password= 'password1234'
    u.password_confirmation = 'password1234'
    u.role = 'especialista'
    link = UiFaces.face
    d.image = File.new(link)
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
end