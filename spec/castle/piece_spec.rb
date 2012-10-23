require 'spec_helper'

describe Castle::Piece do
  describe "#initialize" do
    let(:piece) { Castle::Piece.new(:white, [0, 0]) }

    it "accepts a color and a coordinate" do
      piece.color.should eq :white
      piece.square.should eq [0, 0]
    end
  end

  describe "#square" do
    context "when asked in algebraic for" do
      let(:piece) { Castle::Piece.new(:white, [6, 5]) }

      it "returns the algebraic name of the square" do
        piece.square(:algebraic).should eq :g6
      end
    end
  end

  describe ".from_fen" do
    context "P" do
      let(:piece) { Castle::Piece.from_fen('P', [0, 1]) }

      it "constructs a black pawn" do
        piece.name.should eq 'pawn'
        piece.color.should eq :white
        piece.square.should eq [0, 1]
      end
    end

    context "p" do
      let(:piece) { Castle::Piece.from_fen('p', [0, 1]) }

      it "constructs a black pawn" do
        piece.name.should eq 'pawn'
        piece.color.should eq :black
        piece.square.should eq [0, 1]
      end
    end
  end
end
