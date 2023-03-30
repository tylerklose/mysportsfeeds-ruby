require 'spec_helper'

versions = ['1.0', '1.1', '1.2', '2.1']

versions.each do |version|
	describe "MySportsFeeds object for API #{version}" do
		before :each do
		    @msf = MySportsFeeds.new(version, true)
		end

		describe "#new" do
			it "returns a MySportsFeeds object" do
				@msf.should be_an_instance_of MySportsFeeds
			end
		end

		describe "#authenticate for API v#{version}" do
			it "succeeeds" do
				@msf.authenticate("username", "password")
			end
		end

		describe "#msf_get_data" do
			it "gets all player game logs for Stephen Curry in the NBA 2016-2017 regular season in JSON format" do
				@msf.authenticate("YOUR_USERNAME", "YOUR_PASSWORD")
				data = @msf.msf_get_data("nba", "2016-2017-regular", "player_gamelogs", "json",
					"player" => "stephen-curry", "playerstats" => "FGA,FGM")
			end
		end

	end
end
