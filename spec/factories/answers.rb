FactoryGirl.define do
  factory :answer do
    body "MyText2"
    question
    user
  end
  factory :invalid_answer, class: Answer do
    body nil
    question
    user
  end
end
