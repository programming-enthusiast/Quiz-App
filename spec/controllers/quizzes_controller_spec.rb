require 'rails_helper'

RSpec.describe QuizzesController, type: :controller do
  let(:valid_attributes) {
    build(:quiz).attributes
  }

  let(:invalid_attributes) {
    {title: nil}
  }

  let(:quiz) { create(:quiz) }
  let(:user) { quiz.user }

  describe 'GET #index' do
    before(:each) do
      sign_in user
      get :index, params: {}
    end

    it 'has http status :ok' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    before(:each) do
      sign_in user
      get :show, params: {id: quiz.to_param}
    end

    it 'has http status :ok' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #new' do
    before(:each) do
      sign_in user
      get :new, params: {}
    end

    it 'has http status :ok' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #edit' do
    before(:each) do
      sign_in user
      get :edit, params: {id: quiz.to_param}
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
      it 'creates a new Quiz' do
        expect {
          post :create, params: {quiz: valid_attributes}
        }.to change(Quiz, :count).by(1)
      end

      it 'redirects to the created quiz' do
        post :create, params: {quiz: valid_attributes}
        expect(response).to redirect_to(Quiz.last)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Quiz' do
        expect {
          post :create, params: {quiz: invalid_attributes}
        }.to change(Quiz, :count).by(0)
      end

      it 'has http status :ok' do
        post :create, params: {quiz: invalid_attributes}
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        attributes_for(:quiz)
      }

      before(:each) do
        sign_in user
        put :update, params: {id: quiz.to_param, quiz: new_attributes}
      end

      it 'updates the requested quiz' do
        quiz.reload
        expect(quiz.title).to eq(new_attributes[:title])
      end

      it 'redirects to the quiz' do
        expect(response).to redirect_to(quiz)
      end
    end

    context 'with invalid params' do
      before(:each) do
        sign_in user
        put :update, params: {id: quiz.to_param, quiz: invalid_attributes}
      end

      it 'does not update the requested quiz' do
        title_was = quiz.title
        quiz.reload
        expect(quiz.title).to eq(title_was)
      end

      it 'has http status :ok' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested quiz' do
      sign_in user

      expect {
        delete :destroy, params: {id: quiz.to_param}
      }.to change(Quiz, :count).by(-1)
    end

    it 'redirects to the quizzes list' do
      sign_in user

      delete :destroy, params: {id: quiz.to_param}
      expect(response).to redirect_to(quizzes_url)
    end
  end
end
