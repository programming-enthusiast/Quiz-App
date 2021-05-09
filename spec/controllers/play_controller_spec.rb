require 'rails_helper'

RSpec.describe PlayController, type: :controller do
  describe 'GET #show' do
    let!(:quiz) { create(:quiz) }

    before(:each) do
      get :show, params: {id: quiz.to_param}
    end

    it 'has http status :ok' do
      expect(response).to have_http_status(:ok)
    end
  end
end
