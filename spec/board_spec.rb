require "rspec"
require_relative "../lib/board"

describe Board do
  subject(:board) { described_class.new() }

  it "should exist" do
    expect(board).not_to be_nil
  end

end