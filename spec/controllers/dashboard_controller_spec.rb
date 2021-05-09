require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  context 'with logged in user' do
    let(:user) { create(:user) }

    before(:each) do
      sign_in user
    end

    describe 'GET #index' do
      before(:each) do
        get :index
      end

      it 'has http status :ok' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  context 'with logged out user' do
    describe 'GET #index' do
      before(:each) do
        get :index
      end

      it 'has http status :found' do
        expect(response).to have_http_status(:found)
      end

      it 'redirects to log in url' do
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end
end
