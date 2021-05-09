namespace :db do
  desc 'Refresh database'
  task refresh: :environment do
    RefreshDatabaseJob.perform_now
  end
end
