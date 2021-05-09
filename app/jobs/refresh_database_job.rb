class RefreshDatabaseJob < ApplicationJob
  queue_as :default

  def perform(*)
    %w(Answer Question User).each do |klass|
      klass.constantize.destroy_all
    end

    Rails.application.load_seed
  end
end
