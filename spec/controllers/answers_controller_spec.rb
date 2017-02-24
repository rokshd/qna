require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:question) { create(:question) }

  describe 'GET #new' do
    sign_in_user

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
    sign_in_user

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

  describe 'GET #show' do
    let(:answer) { create(:answer) }

    before { get :show, params: { id: answer } }

    it 'assigns the requested answer to @answer' do
      expect(assigns(:answer)).to eq answer
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

end
