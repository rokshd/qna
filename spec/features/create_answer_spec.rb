require 'rails_helper'

feature 'Create answer', %q{
  In order to give own solution
  As an authenticated user
  I want to be able to answer to questions
} do

  given(:user) { create(:user) }
  given(:question) { create(:question) }
  given(:answer) { create(:answer) }

  scenario 'Authenticated user creates an answer' do
    sign_in(user)

    visit question_path(question)
    fill_in 'Your answer:', with: answer.body
    click_on 'Create'

    expect(page).to have_content answer.body
  end

  scenario 'Non-authenticated user creates an answer' do
    visit question_path(question)
    fill_in 'Your answer:', with: answer.body
    click_on 'Create'

    expect(page).to have_content 'You need to sign in or
      sign up before continuing.'
  end
end
