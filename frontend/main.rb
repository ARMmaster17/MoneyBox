#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'slim'
require 'rest-client'
require 'json'
require 'sinatra/activerecord'
require 'rack-flash'
require 'securerandom'
require_relative '../config/environments'
require_relative 'inc/notifications'
require_relative 'inc/pagevars'
require_relative 'inc/mailer'
require_relative 'inc/dateservice'
require_relative 'inc/viewdata'
require_relative 'inc/pagination'
require_relative 'inc/externaljob'

set :port, ENV['PORT'] || 8080
set :bind, ENV['IP'] || '0.0.0.0'


enable :sessions
use Rack::Flash

helpers do
  ##
  # Defines if current user is logged in
  def login?
    if ENV['CI']
      return true
    elsif !session[:authusr].nil? || !session[:sso_auth].nil?
      return true
    else
      return false
    end
  end
  ##
  # Generates a new session key to use for verifying API calls
  def gen_api_key!
    session[:apikey] = SecureRandom.urlsafe_base64(25)
  end
end
##
# Route handler for home page
get '/' do
  # Transfer all locals to instance variables
  @view_data = ViewData.new('bootstrap_v3', 'Home', flash[:notice])
  slim :home
end
##
# Catch-all 404 error handler
not_found do
  @view_data = ViewData.new('bootstrap_v3', 'Page Not Found', flash[:notice])
  slim :error_404
end