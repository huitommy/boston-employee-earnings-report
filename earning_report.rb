require "./lib/earning.rb"
require "sinatra/base"
require 'json'

class EarningReport < Sinatra::Base

  get "/" do
    earnings = Earning.all.uniq { |e| e.title }
    @job_titles = earnings.map { |j| j.title }
    data = { job_titles: @job_titles }
    request.accept.each do |type|
      case type.to_s
      when 'application/json'
        halt data.to_json
      else
        halt erb :index
      end
    end
  end

  get "/:title" do
    @job = params[:title].downcase
    earning = Earning.all.select { |e| e.title.downcase.include?(@job)}
    @job_titles = earning.map{ |j| j.title }.uniq
    if earning.empty?
      @average_earnings = 0
      data = { "error": { code: 404, message: "Job title not found" } }
    else
      @average_earnings = earning.map { |e| e.total_earning.to_f }.reduce(:+) / earning.size
      data = { "data": { title: @job, average_earnings: @average_earnings } }
    end
    request.accept.each do |type|
      case type.to_s
      when 'application/json'
        halt data.to_json
      else
        halt erb :show
      end
    end
  end

end
