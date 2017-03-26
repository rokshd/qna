require_relative 'feature_helper'

feature 'Add files to question', %q{
  in order to illustrate my question
  as a question's author
  i'd like to be able to attach files
} do
  given(:user) { create(:user) }
  given(:question) { create(:question) }

  background do
    sign_in(user)
    visit new_question_path
    fill_in 'Title', with: question.title
    fill_in 'Body', with: question.body
  end

  scenario 'User attach file when asks a question', js: true do
    attach_file 'File', "#{Rails.root}/spec/rails_helper.rb"
    click_on 'Create'

    expect(page).to have_link 'rails_helper.rb',
      href: '/uploads/attachment/file/1/rails_helper.rb'
  end

  scenario 'Author can attach files when asks a question', js: true do
    click_on 'attach next file'

    inputs = all('input[type="file"]')

    inputs[0].set("#{Rails.root}/spec/rails_helper.rb")
    inputs[1].set("#{Rails.root}/spec/spec_helper.rb")

    click_on 'Create'

    expect(page).to have_link 'rails_helper.rb',
      href: '/uploads/attachment/file/1/rails_helper.rb'
    expect(page).to have_link 'spec_helper.rb',
      href: '/uploads/attachment/file/2/spec_helper.rb'
  end
end
