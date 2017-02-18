require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Qna
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_spec: false,
        controller_spec: true,
        helper_specs: false,
        routing_specs: false,
        requests_specs: false
      g.fixtures_replacement :factory_girl, dir: 'spec/factories'
    end
  end
end
