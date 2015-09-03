ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
require 'minitest/rails'

require 'capybara/rails'
require 'minitest/rails/capybara'
Minitest::Reporters.use!(
  Minitest::Reporters::ProgressReporter.new,
  ENV,
  Minitest.backtrace_filter
)

# for creating sessions in tests
include Warden::Test::Helpers
Warden.test_mode!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all
end

class ActionController::TestCase
  include Devise::TestHelpers
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end

class PolicyTest < ActiveSupport::TestCase
  def assert_permissions(current_user, record, available_actions, permissions_hash = {})
    permissions_hash.each do |action, should_be_permitted|
      if should_be_permitted
        assert_permit current_user, record, action
      else
        refute_permit current_user, record, action
      end
    end

    # Make sure all available actions were tested
    unused_actions = @available_actions - permissions_hash.keys
    assert unused_actions.empty?, "The following actions were not tested: #{ unused_actions }"

      # Make sure tested actions were in available_actions
      unavailable_actions = permissions_hash.keys - @available_actions
    assert unavailable_actions.empty?, "The following actions were tested, but not in available_actions: #{ unavailable_actions }"
  end

  def assert_permit(current_user, record, action)
    assert permit(current_user, record, action), "User #{ current_user } should be permitted #{ action } on #{ record }, but isn't permitted"
  end

  def refute_permit(current_user, record, action)
    refute permit(current_user, record, action), "User #{ current_user } should NOT be permitted #{ action } on #{ record }, but is permitted"
  end

  def permit(current_user, record, action)
    self.class.to_s.gsub(/Test/, "").constantize.new(current_user, record).public_send("#{ action.to_s }?")
  end
end

