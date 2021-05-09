require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Quizzer
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Bower asset paths
    config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components')
    # Precompile Bootstrap fonts
    config.assets.precompile << %w(*.svg *.eot *.woff *.ttf)
    # Minimum Sass number precision required by bootstrap-sass
    # ::Sass::Script::Value::Number.precision = [8, ::Sass::Script::Value::Number.precision].max

    # Handle Pundit::NotAuthorizedError as a 403 error
    config.action_dispatch.rescue_responses['Pundit::NotAuthorizedError'] = :forbidden

    config.generators do |g|
      g.test_framework :rspec, view_specs: false, request_specs: false, routing_specs: false
    end
  end
end
