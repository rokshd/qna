require 'rails_helper'

feature 'Create question', %q{
  in order to get answer from community
  as an authenticated user
  i want to be able to ask questions
} do

  given(:user) { create(:user) }
  given(:question) { create(:question) }

  scenario 'Authenticated user creates question with valid attributes' do
    sign_in(user)

    visit questions_path
    click_on 'Ask question'
    fill_in 'Title', with: question.title
    fill_in 'Body', with: question.body
    click_on 'Create'

    expect(page).to have_content 'Your question has been successfully created.'
    expect(page).to have_content question.title
    expect(page).to have_content question.body
  end

  scenario 'Authenticated user creates question with invalid attributes' do
    sign_in(user)

    visit questions_path
    click_on 'Ask question'
    fill_in 'Title', with: ''
    fill_in 'Body', with: ''
    click_on 'Create'

    expect(page).to have_content 'Title can\'t be blank'
    expect(page).to have_content 'Body can\'t be blank'
    expect(page).to have_no_content question.title
    expect(page).to have_no_content question.body
  end

  scenario 'Non-authenticated user tries to create quesition' do
    visit questions_path
    click_on 'Ask question'

    expect(page).to have_content 'You need to sign in or
      sign up before continuing.'
  end
end
