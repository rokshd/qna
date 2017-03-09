require_relative 'feature_helper'

feature 'Access to questions', %q{
  In order to find an important question
  As an any user
  I want to be able to view all questions
} do

  given(:user) { create(:user) }
  given!(:questions) { create_list(:question, 3) }

  scenario 'Authenticated user can see a questions list' do
    sign_in(user)
    visit questions_path

    expect(page).to have_content "Question List"
    questions.each { |question| expect(page).to have_content question.title }
  end

  scenario 'Non-authenticated user can see a questions list' do
    visit questions_path

    expect(page).to have_content "Question List"
    questions.each { |question| expect(page).to have_content question.title }
  end
end
