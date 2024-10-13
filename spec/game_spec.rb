require "rspec"
require_relative "../lib/game"

describe Game do
	subject(:game) { described_class.new }
	let(:p1) { double }
	let(:p2) { double }

	it "should exist" do
		expect(game).not_to be_nil
	end

	describe "#get_player_move" do
		it "should display error once if first input is a letter and second is a number" do
			allow(game).to receive(:gets).and_return("a", "1")
			expect(game).to receive(:puts).once.with("invalid")
			game.get_player_move
		end

		it "should display error twice if first two inputs are letters" do
			allow(game).to receive(:gets).and_return("a", "b", "1")
			expect(game).to receive(:puts).twice.with("invalid")
			game.get_player_move
		end

		it "should not display error if first input is number" do
			allow(game).to receive(:gets).and_return("2")
			expect(game).not_to receive(:puts).with("invalid")
			game.get_player_move
		end
	end	
end