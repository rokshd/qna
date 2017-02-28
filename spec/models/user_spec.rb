require 'rails_helper'

RSpec.describe User do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }

  describe "author_of?" do
    let(:man_in_black) { create(:user) }
    let(:user) { create(:user) }
    let(:question) { create(:question, user: man_in_black) }
    let(:answer) { create(:answer, question: question, user: man_in_black)}

    context 'user_id and object_id are the same' do
      it "compares user_id and question_id" do
        expect(man_in_black.author_of?(question)).to eq true
      end

      it "compares user_id and answer_id" do
        expect(man_in_black.author_of?(answer)).to eq true
      end
    end

    context 'user_id and object_id are different' do
      it "compares user_id and question_id" do
        expect(user.author_of?(question)).to eq false
      end

      it "compares user_id and answer_id" do
        expect(user.author_of?(answer)).to eq false
      end
    end
  end
end
