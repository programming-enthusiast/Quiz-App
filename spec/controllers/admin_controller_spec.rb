require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  context 'with logged in admin' do
    let(:user) { create(:admin) }

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

  context 'with logged in user' do
    let(:user) { create(:user) }

    before(:each) do
      sign_in user
    end

    describe 'GET #index' do
      before(:each) do
        get :index
      end

      it 'redirects to root url' do
        expect(response).to redirect_to(root_url)
      end
    end
  end

  context 'with logged out user' do
    describe 'GET #index' do
      before(:each) do
        get :index
      end

      it 'redirects to root url' do
        expect(response).to redirect_to(root_url)
      end
    end
  end
end
