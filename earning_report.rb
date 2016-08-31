require "./lib/earning.rb"
require "sinatra/base"
require 'json'

class EarningReport < Sinatra::Base
  get "/" do
    earnings = Earning.all.uniq { |e| e.title }
    @job_titles = earnings.map { |j| j.title }
    erb :index
  end

  get "/:title" do
    @job = params[:title].downcase
    earning = Earning.all.select { |e| e.title.downcase.include?(@job)}
    @job_titles = earning.map{ |j| j.title }.uniq
    @average_earnings = earning.map { |e| e.total_earning.to_f }.reduce(:+) / earning.size
    erb :show
  end
end
