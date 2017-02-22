FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@qwe.ru"
  end
  factory :user do
    email
    password '12345678'
    password_confirmation '12345678'
  end
end
