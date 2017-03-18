require_relative 'feature_helper'

feature 'Edit question', %q{
  in order to fix mistake
  as an author of question
  i'd like to be able to edit a question
} do
  given(:user) { create(:user) }
  given(:author) { create(:user) }
  given!(:question) { create(:question, user: author) }

  context 'as an signed in user' do
    context 'and author of question' do
      before do
        sign_in author
        visit question_path(question)
      end

      context 'with valid attrubutes' do
        scenario 'tries to make changes', js: true do
          within '.question' do
            click_on 'Edit question'

            fill_in 'Title', with: 'tra-ta-ta'
            fill_in 'Question', with: 'bla-bla-bla'
            click_on 'Save Question'

            expect(page).to have_content 'tra-ta-ta'
            expect(page).to have_content 'bla-bla-bla'
            expect(page).to have_no_selector 'textarea'
          end
        end
      end

      context 'with invalid attrubutes' do
        scenario 'tries to make changes', js: true do
          within '.question' do
            click_on 'Edit question'
            fill_in 'Title', with: nil
            fill_in 'Question', with: nil
            click_on 'Save Question'
            expect(page).to have_content 'Title can\'t be blank'
            expect(page).to have_content 'Body can\'t be blank'
          end
        end
      end
    end

    context 'and a not author of question' do
      before do
        sign_in user
        visit question_path(question)
      end

      scenario 'tries to make changes' do
        within '.question' do
          expect(page).to_not have_link 'Edit'
        end
      end
    end
  end

  context 'as a not signed in user' do
    scenario 'tries to make changes' do
      visit question_path(question)
      expect(page).to_not have_link 'Edit'
    end
  end
end
