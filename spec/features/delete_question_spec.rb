require 'rails_helper'

feature 'Delete question', %q{
  In order to remove my problem
  As an author of the question
  I want to be able to delete the question
} do

  given(:user) { create(:user) }
  given(:main_in_black) { create(:user, email: 'main_in_black@test.ru') }
  given(:question) { create(:question, user: user) }

  scenario 'Authenticated user tries to delete an own question' do
    sign_in(user)

    visit question_path(question)
    click_on 'Delete question'

    expect(page).to have_content 'The question has been successfully deleted.'
  end

  scenario 'Authenticated user tries to delete any question' do
    sign_in(main_in_black)

    visit question_path(question)
    expect(page).to have_no_content 'Delete question'
  end

  scenario 'Non-authenticated user tries to delete a question' do
    visit question_path(question)
    expect(page).to have_no_content 'Delete question'
  end
  
end
