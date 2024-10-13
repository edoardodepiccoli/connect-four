require "rspec"
require_relative "../lib/game"

describe Game do
	let(:player_1) { double }
	let(:player_2) { double }
	subject(:game) { described_class.new(player_1, player_2) }

	it "should exist" do
		expect(game).not_to be_nil
	end

	describe "#initialize" do
		it "should set player 1 to player 1 and player 2 to player 2" do
			expect(game.instance_variable_get(:@player_1)).to eql(player_1)
			expect(game.instance_variable_get(:@player_2)).to eql(player_2)
		end
	end
end