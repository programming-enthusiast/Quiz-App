require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:valid_attributes) {
    build(:category).attributes
  }

  let(:invalid_attributes) {
    {name: nil}
  }

  let(:category) { create(:category) }
  let(:user) { create(:admin) }

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
      get :show, params: {id: category.to_param}
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
      get :edit, params: {id: category.to_param}
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
      it 'creates a new Category' do
        expect {
          post :create, params: {category: valid_attributes}
        }.to change(Category, :count).by(1)
      end

      it 'redirects to the created category' do
        post :create, params: {category: valid_attributes}
        expect(response).to redirect_to(Category.last)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Category' do
        expect {
          post :create, params: {category: invalid_attributes}
        }.to change(Category, :count).by(0)
      end

      it 'has http status :ok' do
        post :create, params: {category: invalid_attributes}
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        attributes_for(:category)
      }

      before(:each) do
        sign_in user
        put :update, params: {id: category.to_param, category: new_attributes}
      end

      it 'updates the requested category' do
        category.reload
        expect(category.name).to eq(new_attributes[:name])
      end

      it 'redirects to the category' do
        expect(response).to redirect_to(category)
      end
    end

    context 'with invalid params' do
      before(:each) do
        sign_in user
        put :update, params: {id: category.to_param, category: invalid_attributes}
      end

      it 'does not update the requested category' do
        name_was = category.name
        category.reload
        expect(category.name).to eq(name_was)
      end

      it 'has http status :ok' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'DELETE #destroy' do
    before(:each) do
      category
      sign_in user
    end

    it 'destroys the requested category' do
      expect {
        delete :destroy, params: {id: category.to_param}
      }.to change(Category, :count).by(-1)
    end

    it 'redirects to the categories list' do
      delete :destroy, params: {id: category.to_param}
      expect(response).to redirect_to(categories_url)
    end
  end
end
