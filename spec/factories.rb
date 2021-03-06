FactoryGirl.define do
  factory :university do
    
  end
  factory :entity do
    name "MyString"
    name_short "MyString"
    type 1
    level 1
  end
  factory :user do
    name                  "Marco Antonio"
    last_name             "Santana"
    sequence(:email)     { |n| "user#{n}@odot.com" }
    password              "password1234"
    password_confirmation "password1234"
    role                  'aspirante'
  end

  factory :document do
     certificate        'curso'
     description        'Un curso de prueba'
     emission_date      Time.now
     :user
  end

end

