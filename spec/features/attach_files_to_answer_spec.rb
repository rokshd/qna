require_relative 'feature_helper'

feature 'Add files to answer', %q{
  in order to illustrate my answer
  as a answer's author
  i'd like to be able to attach files
} do
  given(:user) { create(:user) }
  given!(:question) { create(:question) }

  background do
    sign_in(user)
    visit question_path(question)
    fill_in 'Your answer', with: "blabla"
  end

  scenario 'User attach file when make an answer', js: true do
    attach_file 'File', "#{Rails.root}/spec/rails_helper.rb"

    click_on 'Create'

    within '.answers' do
      expect(page).to have_link 'rails_helper.rb',
        href: /\/uploads\/attachment\/file\/\d+\/rails_helper.rb/
    end
  end

  scenario 'Author attach files when he asks an answer', js: true do
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
