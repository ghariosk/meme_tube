require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?

require_relative './controllers/meme_controller.rb'

use Rack::MethodOverride



run MemeController