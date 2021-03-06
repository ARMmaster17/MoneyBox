require_relative "test_helper"
require "test/unit"
require 'rack/test'
require_relative '../frontend/main'

class TestVersion < Test::Unit::TestCase
  include Rack::Test::Methods
  self.test_order = :defined
  
  # Initialize testing objects
  def app
    Sinatra::Application
  end
  # Test static pages
  def test_frontend_index
    get '/'
    assert last_response.ok?
  end
end