require_relative 'feature_helper'

feature 'Create answer', %q{
  In order to give own solution
  As an authenticated user
  I want to be able to answer to questions
} do

  given(:user) { create(:user) }
  given!(:question) { create(:question) }
  given!(:answer) { create(:answer) }

  scenario 'Authenticated user creates an answer with v_data', js: true do
      sign_in(user)
      visit question_path(question)

      fill_in 'Your answer:', with: answer.body
      click_on 'Create'

      expect(current_path).to eq question_path(question)
      within '.answers' do
        expect(page).to have_content answer.body
      end
  end

  scenario 'Authenticated user creates an answer with inv_data', js: true do
    sign_in(user)
    visit question_path(question)

    fill_in 'Your answer:', with: nil
    click_on 'Create'

    expect(current_path).to eq question_path(question)
    within '.answer-errors' do
      expect(page).to have_content "Body can't be blank"
    end
  end

  scenario 'Non-authenticated user creates an answer' do
    visit question_path(question)
    fill_in 'Your answer:', with: answer.body
    click_on 'Create'

    expect(page).to have_content 'You need to sign in or
      sign up before continuing.'
  end
end
