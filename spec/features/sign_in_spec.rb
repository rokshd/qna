require 'rails_helper'

feature 'User sign in', %q{
  in order to be able ask question
  as an user
  i want to be able to sign in
} do
  scenario 'Registered user try to sign in' do
    User.create!(email:'test@test.ru', password: 'aqwe123')

    visit new_user_session_path
    fill_in 'Email', with: 'test@test.ru'
    fill_in 'Password', with: 'aqwe123'
    click_on 'Log in'

    expect(page).to have_content 'Signed in successfully.'
    expect(current_path).to eq root_path
  end

  scenario 'Non-registered user try to sign in' do
    visit new_user_session_path
    fill_in 'Email', with: 'wrong@test.ru'
    fill_in 'Password', with: 'aqwe123'
    click_on 'Log in'

    expect(page).to have_content 'Invalid Email or password.'
    expect(current_path).to eq new_user_session_path
  end
end
