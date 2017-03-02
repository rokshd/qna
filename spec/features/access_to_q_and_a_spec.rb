require 'rails_helper'

feature 'Access to question and question\'s answers', %q{
  In order to find the answer to important question
  As an any user
  I want to be able to view answers of the question
} do

  given(:user) { create(:user) }
  given(:question) { create(:question) }
  given!(:answers) { create_list(:answer, 3, question: question) }


  scenario 'Authenticated user can see the question\'s answers' do
    sign_in(user)
    visit question_path(question)

    expect(page).to have_content question.title
    expect(page).to have_content question.body
    answers.each { |answer| expect(page).to have_content answer.body }
  end

  scenario 'Non-authenticated user can see the question\'s answers' do
    visit question_path(question)

    expect(page).to have_content question.title
    expect(page).to have_content question.body
    answers.each { |answer| expect(page).to have_content answer.body }
  end
end
