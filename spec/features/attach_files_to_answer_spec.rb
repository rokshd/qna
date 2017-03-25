require_relative 'feature_helper'

feature 'Add files to answer', %q{
  in order to illustrate my answer
  as a answer's author
  i'd like to be able to attach files
} do
  given(:user) { create(:user) }
  given(:question) { create(:question) }

  background do
    sign_in(user)
    visit question_path(question)
  end

  scenario 'User attach file when make an answer', js: true do
    fill_in 'Your answer', with: "blabla"
    attach_file 'File', "#{Rails.root}/spec/rails_helper.rb"
    click_on 'Create'

    within '.answers' do
      expect(page).to have_link 'rails_helper.rb',
        href: '/uploads/attachment/file/1/rails_helper.rb'
    end
  end
end
