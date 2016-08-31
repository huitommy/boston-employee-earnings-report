require "spec_helper"

RSpec.describe Earning, vcr: true do
  context "earning can be accessed" do
    let(:earning) { Earning.new({ "title" => "Teacher", "total_earnings" => 60000 }) }

    describe "#title" do
      it "returns the job title" do
        expect(earning.title).to eq("Teacher")
      end
    end

    describe "#total_earning" do
      it "returns the total earnings" do
        expect(earning.total_earning).to eq(60000)
      end
    end

    describe ".all" do
      it "returns an array of Earning objects" do
        earning = Earning.all
        expect(earning[0]).to be_a(Earning)
      end
    end
  end
end
