require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails'
require 'capybara/rspec'
require 'capybara/email/rspec'
require 'database_cleaner'

DatabaseCleaner.orm='mongoid'
DatabaseCleaner.strategy = :truncation


Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.include Mongoid::Matchers
  config.include FactoryGirl::Syntax::Methods
  config.include Capybara::DSL,                  type: :request
  config.include Capybara::RSpecMatchers,       type: :request
  config.infer_base_class_for_anonymous_controllers = true
  config.order = "random"

  config.before(:each) do
    ActionMailer::Base.deliveries.clear
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

def sign_in_with(resource)
  name_resource = resource.class.to_s.downcase

  visit "/#{name_resource.pluralize}/sign_in"

  fill_in "#{name_resource}[email]",    with: resource.email
  fill_in "#{name_resource}[password]", with: '123123123'

  click_button "Sign in"
end
