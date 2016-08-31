require "./lib/earning.rb"
require "sinatra/base"
require 'json'

class EarningReport < Sinatra::Base
  get '/' do
    @title = "Hello World"
    erb :index
  end
end
