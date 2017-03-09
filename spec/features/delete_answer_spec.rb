require_relative 'feature_helper'

feature 'Delete answer', %q{
  in order to delete incorrect answer
  as an author of the answer
  i want to be able to delete the answer
} do

  given(:user) { create(:user) }
  given(:main_in_black) { create(:user, email: 'main_in_black@test.ru') }
  given(:question) { create(:question, user: user) }
  given!(:answer) { create(:answer, question: question, user: user) }

  scenario 'Authenticated user tries to delete the own answer' do
    sign_in(user)

    visit question_path(question)
    click_on 'Delete answer'

    expect(page).to have_content 'The answer has been successfully deleted.'
    expect(page).to have_no_content answer.body
  end

  scenario 'Authenticated user tries to delete an any answer' do
    sign_in(main_in_black)
    visit question_path(question)

    expect(page).to have_no_link 'Delete answer'
  end

  scenario 'Non-authenticated user tries to delete an answer' do
    visit question_path(question)

    expect(page).to have_no_link 'Delete answer'
  end

end
