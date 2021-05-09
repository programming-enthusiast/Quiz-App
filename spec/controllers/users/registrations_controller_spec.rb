require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  controller do
    def after_sign_up_path_for(resource)
      super resource
    end
  end

  let(:user) { build(:user) }

  describe 'after sign up path for a user' do
    it 'returns dashboard_path' do
      expect(controller.after_sign_up_path_for(user)).to eq(dashboard_path)
    end
  end
end
