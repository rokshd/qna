require 'rails_helper'

RSpec.describe AnswerController, type: :controller do
  let(:question) { create(:question) }

  describe 'GET #new' do
    before { get :new, params: { question_id: question } }

    it 'assigns a requested question to @question' do
      expect(assigns(:question)).to eq question
    end
    it 'assigns a new answer to @answer' do
      expect(assigns(:answer)).to be_a_new(Answer)
    end
    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    it 'assigns the requested question to @question' do
      post :create, params: { question_id: question,
        answer: attributes_for(:answer) }
      expect(assigns(:question)).to eq question
    end

    context 'with valid attributes' do
      it 'saves the new answer to database' do
        expect { post :create, params: { question_id: question, answer:
          attributes_for(:answer) } }.to change(question.answers, :count).by(1)
      end
      it 'redirects to question view' do
        post :create, params: { question_id: question,
          answer: attributes_for(:answer) }
        expect(response).to redirect_to assigns(:question)
      end
    end
    context 'with invalid attributes' do
      it 'does not save the answer' do
        expect { post :create, params: { question_id: question, answer:
          attributes_for(:invalid_answer) } }.to_not change(Answer, :count)
      end
      it 're-renders new view' do
        post :create, params: { question_id: question,
          answer: attributes_for(:invalid_answer) }
        expect(:response).to render_template :new
      end
    end
  end

end
