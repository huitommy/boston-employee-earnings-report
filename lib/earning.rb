require 'json'
require 'net/http'
require 'pry'

class Earning
  attr_reader :title, :total_earning

  def initialize(args)
    @title = args["title"]
    @total_earning = args["total_earnings"]
  end

  def self.all
    jobs = []
    average_earnings = Hash.new(0)
    uri = URI("https://data.cityofboston.gov/resource/ntv7-hwjm.json")
    response = Net::HTTP.get_response(uri)
    job_earnings = JSON.parse(response.body)
    job_earnings.each do |job|
      title = job["title"]
      average_earnings[title] += 1
      jobs << Earning.new(job)
    end
    jobs
  end
end
