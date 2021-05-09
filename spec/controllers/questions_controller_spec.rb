require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:valid_attributes) {
    attributes_for(:question)
  }

  let(:invalid_attributes) {
    {text: nil}
  }

  let(:question) { create(:question) }
  let(:quiz) { question.quiz }
  let(:user) { quiz.user }

  describe 'GET #index' do
    before(:each) do
      sign_in user
      get :index, params: {quiz_id: quiz}
    end

    it 'has http status :ok' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    before(:each) do
      sign_in user
      get :show, params: {quiz_id: quiz, id: question.to_param}
    end

    it 'has http status :ok' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #new' do
    before(:each) do
      sign_in user
      get :new, params: {quiz_id: quiz}
    end

    it 'has http status :ok' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #edit' do
    before(:each) do
      sign_in user
      get :edit, params: {quiz_id: quiz, id: question.to_param}
    end

    it 'has http status :ok' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    before(:each) do
      sign_in user
    end

    context 'with valid params' do
      it 'creates a new Question' do
        expect {
          post :create, params: {quiz_id: quiz, question: valid_attributes}
        }.to change(Question, :count).by(1)
      end

      it 'redirects to the questions_url' do
        post :create, params: {quiz_id: quiz, question: valid_attributes}
        expect(response).to redirect_to(quiz_questions_url(quiz))
      end
    end

    context 'with invalid params' do
      it 'does not create a new Question' do
        expect {
          post :create, params: {quiz_id: quiz, question: invalid_attributes}
        }.to change(Question, :count).by(0)
      end

      it 'has http status :ok' do
        post :create, params: {quiz_id: quiz, question: invalid_attributes}
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      before(:each) do
        sign_in user
        put :update, params: {quiz_id: quiz, id: question.to_param, question: valid_attributes}
      end

      it 'updates the requested question' do
        question.reload
        expect(question.text).to eq(valid_attributes[:text])
      end

      it 'redirects to the questions_url' do
        expect(response).to redirect_to(quiz_questions_url(question.quiz))
      end
    end

    context 'with invalid params' do
      before(:each) do
        sign_in user
        put :update, params: {quiz_id: quiz, id: question.to_param, question: invalid_attributes}
      end

      it 'does not update the requested question' do
        text_was = question.text
        question.reload
        expect(question.text).to eq(text_was)
      end

      it 'has http status :ok' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested question' do
      sign_in user

      expect {
        delete :destroy, params: {quiz_id: quiz, id: question.to_param}
      }.to change(Question, :count).by(-1)
    end

    it 'redirects to the question list' do
      sign_in user

      delete :destroy, params: {quiz_id: quiz, id: question.to_param}
      expect(response).to redirect_to(quiz_questions_url(quiz))
    end
  end
end
