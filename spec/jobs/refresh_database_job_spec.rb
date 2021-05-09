require 'rails_helper'

RSpec.describe RefreshDatabaseJob, type: :job do
  let!(:user) { create(:user) }

  before(:all) do
    User.destroy_all
  end

  it 'refreshes the database' do
    expect {
      RefreshDatabaseJob.perform_now
    }.to change(User, :count).by(-1)
  end
end
