require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:valid_attributes) {
    attributes_for(:answer)
  }

  let(:invalid_attributes) {
    {text: nil}
  }

  let(:answer) { create(:answer) }
  let(:question) { answer.question }
  let(:quiz) { question.quiz }
  let(:user) { quiz.user }

  describe 'GET #index' do
    before(:each) do
      sign_in user
      get :index, params: {quiz_id: quiz, question_id: question}
    end

    it 'has http status :ok' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    before(:each) do
      sign_in user
      get :show, params: {quiz_id: quiz, question_id: question, id: answer.to_param}
    end

    it 'has http status :ok' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #new' do
    before(:each) do
      sign_in user
      get :new, params: {quiz_id: quiz, question_id: question}
    end

    it 'has http status :ok' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #edit' do
    before(:each) do
      sign_in user
      get :edit, params: {quiz_id: quiz, question_id: question, id: answer.to_param}
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
      it 'creates a new Answer' do
        expect {
          post :create, params: {quiz_id: quiz, question_id: question, answer: valid_attributes}
        }.to change(Answer, :count).by(1)
      end

      it 'redirects to the answers_url' do
        post :create, params: {quiz_id: quiz, question_id: question, answer: valid_attributes}
        expect(response).to redirect_to(quiz_question_answers_url(quiz, question))
      end
    end

    context 'with invalid params' do
      it 'does not create a new Answer' do
        expect {
          post :create, params: {quiz_id: quiz, question_id: question, answer: invalid_attributes}
        }.to change(Answer, :count).by(0)
      end

      it 'has http status :ok' do
        post :create, params: {quiz_id: quiz, question_id: question, answer: invalid_attributes}
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      before(:each) do
        sign_in user
        put :update, params: {quiz_id: quiz, question_id: question, id: answer.to_param,
                              answer: valid_attributes}
      end

      it 'updates the requested answer' do
        answer.reload
        expect(answer.text).to eq(valid_attributes[:text])
      end

      it 'redirects to the answers_url' do
        expect(response).to redirect_to(quiz_question_answers_url(quiz, question))
      end
    end

    context 'with invalid params' do
      before(:each) do
        sign_in user
        put :update, params: {quiz_id: quiz, question_id: question, id: answer.to_param,
                              answer: invalid_attributes}
      end

      it 'does not update the requested answer' do
        text_was = answer.text
        answer.reload
        expect(answer.text).to eq(text_was)
      end

      it 'has http status :ok' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested answer' do
      sign_in user

      expect {
        delete :destroy, params: {quiz_id: quiz, question_id: question, id: answer.to_param}
      }.to change(Answer, :count).by(-1)
    end

    it 'redirects to the question list' do
      sign_in user

      delete :destroy, params: {quiz_id: quiz, question_id: question, id: answer.to_param}
      expect(response).to redirect_to(quiz_question_answers_url(quiz, question))
    end
  end
end
