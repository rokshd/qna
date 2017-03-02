FactoryGirl.define do
  sequence :title do |n|
    "Something title with number - #{n}"
  end
  factory :question do
    title
    body "MyText1"
    user
  end
  factory :invalid_question, class: Question do
    title nil
    body nil
    user
  end
end
