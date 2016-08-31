require "./lib/earning.rb"
require "sinatra/base"
require 'json'

class EarningReport < Sinatra::Base
  get "/" do
    earnings = Earning.all.uniq { |e| e.title }
    @job_titles = earnings.map { |j| j.title }
    erb :index
  end
end
