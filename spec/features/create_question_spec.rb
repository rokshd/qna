require 'rails_helper'

feature 'Create question', %q{
  in order to get answer from community
  as an authenticated user
  i want to be able to ask questions
} do

  given(:user) { create(:user) }

  scenario 'Authenticated user creates question' do
    sign_in(user)

    visit questions_path
    click_on 'Ask question'
    fill_in 'Title', with: 'Test question'
    fill_in 'Body', with: 'Test body'
    click_on 'Create'

    expect(page).to have_content 'Your question successfully created.'
  end

  scenario 'Non-authenticated user tries to create quesition' do
    visit questions_path
    click_on 'Ask question'

    expect(page).to have_content 'You need to sign in or
      sign up before continuing.'
  end
end
