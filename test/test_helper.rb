ENV["TASK_MANAGER_ENV"] ||= "test"

require File.expand_path("../../config/environment",  __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'

# DatabaseCleaner.strategy = :transaction

# class MiniTest::Test
#   def setup
#     DatabaseCleaner.start
#   end
#
#   def teardown
#     DatabaseCleaner.clean
#   end
# end

class Minitest::Test
  def teardown
    TaskManager.delete_all
  end
end

Capybara.app = TaskManagerApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
end
