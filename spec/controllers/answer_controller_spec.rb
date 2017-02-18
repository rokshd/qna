require 'rails_helper'

RSpec.describe AnswerController, type: :controller do
  let(:answer) { create(:answer) }

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new answer to @answer' do
      expect(assigns(:answer)).to be_a_new(Answer)
    end
    it 'renders new view' do
      expect(:response).to render_template :new
    end
  end

end
