require "rspec"
require_relative "../lib/board"

describe Board do
  subject(:board) { described_class.new() }

  it "should exist" do
    expect(board).not_to be_nil
  end

  describe "#initialize" do
    it "should initialize a board full of ⚫️" do
      expect(board.board_array).to eql([
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️"
      ]) 
    end
  end

  describe "#get_move_index" do
    it "should return 5*7 + 0 = 35" do
      board.board_array = [
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️"
      ]

      expect(board.get_move_index(0)).to eql(35)
    end

    it "should return 4*7 + 0 = 28" do
      board.board_array = [
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "🔴",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️"
      ]

      expect(board.get_move_index(0)).to eql(28)
    end

    it "should return 2*7 + 1 = 15" do
      board.board_array = [
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "🔴",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️"
      ]

      expect(board.get_move_index(1)).to eql(15)
    end

    it "should return -1*7 + 1 = -6" do
      board.board_array = [
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "🔴",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️"
      ]

      expect(board.get_move_index(1)).to eql(-6)
    end
  end

  describe "#move_index_valid?" do
    it "should return false if index out of bounds" do
      board.board_array = [
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "🔴",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️"
      ]

      expect(board.move_index_valid?(-1)).to eql(false)
    end

    it "should return false if board at index is already occupied" do
      board.board_array = [
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "🔴",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️"
      ]

      expect(board.move_index_valid?(1)).to eql(false)
    end

    it "should return true if board at index is free and not out of bounds" do
      board.board_array = [
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "🔴",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️"
      ]

      expect(board.move_index_valid?(2)).to eql(true)
    end
  end

  describe "#make_move" do
    it "should change the board with the right symbol" do
      expect { board.make_move(5, "🔴") }.to change { board.board_array }
    end

    it "should change the board with the right symbol" do
      expect { board.make_move(7, "🔵") }.to change { board.board_array }
    end
  end

  describe "#finished" do
    it "should return false if game not finished" do
      board.board_array = [
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "🔴",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️"
      ]

      expect(board.finished?).to eql(false)
    end

    it "should return true if board full" do
      board.board_array = [
        "🔵",  "🔵",  "🔴",  "🔴",  "🔵",  "🔵",  "🔵",
        "🔴",  "🔴",  "🔵",  "🔵",  "🔴",  "🔴",  "🔴",
        "🔴",  "🔴",  "🔴",  "🔵",  "🔴",  "🔴",  "🔴",
        "🔵",  "🔵",  "🔴",  "🔴",  "🔴",  "🔵",  "🔵",
        "🔴",  "🔴",  "🔵",  "🔵",  "🔵",  "🔴",  "🔴",
        "🔴",  "🔴",  "🔵",  "🔵",  "🔴",  "🔵",  "🔴",
      ]

      expect(board.finished?).to eql(true)
    end

    it "should return true if vertical winner" do
      board.board_array = [
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "🔴",  "🔵",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️"
      ]

      expect(board.finished?).to eql(true)
    end

    it "should return true if diagonal winner" do
      board.board_array = [
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "🔴",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔴",  "🔴",  "🔵",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔴",  "🔴",  "🔵",  "⚫️",  "⚫️",  "⚫️",
        "🔴",  "🔵",  "🔴",  "🔵",  "⚫️",  "⚫️",  "⚫️"
      ]

      expect(board.finished?).to eql(true)
    end

    it "should return true if horizontal winner" do
      board.board_array = [
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔵",  "⚫️",  "🔴",  "⚫️",  "⚫️",  "⚫️",
        "⚫️",  "🔴",  "🔴",  "🔵",  "⚫️",  "⚫️",  "⚫️",
        "🔴",  "🔴",  "🔴",  "🔴",  "⚫️",  "⚫️",  "⚫️",
        "🔴",  "🔵",  "🔴",  "🔵",  "⚫️",  "⚫️",  "⚫️"
      ]

      expect(board.finished?).to eql(true)
    end
  end
end







