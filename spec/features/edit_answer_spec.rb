require_relative 'feature_helper'

feature 'Edit answer', %q{
  in order to make changes
  as an author of answer
  i want to be able to correct the answer
} do
  given(:user) { create(:user) }
  given(:author) { create(:user) }
  given!(:question) { create(:question) }
  given!(:answer) { create(:answer, question: question, user: author) }

  context 'as an signed in user' do
    context 'and author of answer' do
      before do
        sign_in(author)
        visit question_path(question)
      end

      context 'with valid attrubutes' do
        scenario 'tries to make changes', js: true do
          within '.answers' do
            click_on 'Edit'
            fill_in 'Answer', with: 'bla-bla'
            click_on 'Save Answer'
            expect(page).to have_content 'bla-bla'
            expect(page).to have_no_selector 'textarea'
          end
        end
      end

      context 'with invalid attributes' do
        scenario 'tries to make changes', js: true do
          within '.answers' do
            click_on 'Edit'
            fill_in 'Answer', with: nil
            click_on 'Save Answer'
            expect(page).to have_content "Body can\'t be blank"
          end
        end
      end
    end

    context 'and not author of answer' do
      before do
        sign_in(user)
        visit question_path(question)
      end

      scenario 'tries to make changes' do
        within '.answers' do
          expect(page).to_not have_link 'Edit'
        end
      end
    end
  end

  scenario 'as a not signed user tries to make changes' do
    visit question_path(question)
    expect(page).to_not have_link 'Edit'
  end
end
