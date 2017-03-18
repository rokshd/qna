require_relative 'feature_helper'

feature 'User sign up', %q{
  in order to be able ask questions
  as a registered user
  i want to be able to sign up
} do
  given(:user) { create(:user) }

  scenario 'Guest user tries to sign up' do
    visit new_user_registration_path
    fill_in 'Email', with: 'qweqwe@qwe.ru'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
    expect(current_path).to eq root_path
  end
end
