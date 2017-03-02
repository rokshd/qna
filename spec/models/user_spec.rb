require 'rails_helper'

RSpec.describe User do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }

  describe "author_of?" do
    let(:user) { create(:user) }
    let(:man_in_black) { create(:user) }
    let(:question) { create(:question, user: man_in_black) }
    let(:answer) { create(:answer, question: question, user: man_in_black) }

    context 'user_id and object_id are the same' do
      it "compares user_id and question_id" do
        expect(man_in_black).to be_author_of(question)
      end
    end

    context 'user_id and object_id are different' do
      it "compares user_id and question_id" do
        expect(user).to_not be_author_of(question)
      end
    end
  end
end
