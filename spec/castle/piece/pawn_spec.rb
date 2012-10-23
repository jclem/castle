require 'spec_helper'

describe Castle::Piece::Pawn do
  let(:pawn) { Castle::Piece::Pawn.new(:white, [0, 1]) }

  describe "#move_deltas" do
    context "on its first move" do
      let(:pawn) { Castle::Piece::Pawn.new(:black, [0, 1]) }

      it "can move one or two squares forward" do
        pawn.move_deltas.should eq [[0, 1], [0, 2]]
      end
    end

    context "on moves after the first move" do
      let(:pawn) { Castle::Piece::Pawn.new(:white, [4, 4]) }

      before { pawn.has_moved }

      it "can move one square forward" do
        pawn.move_deltas.should eq [[0, 1]]
      end
    end
  end

  describe "#threat_deltas" do
    it "threatens diagonally ahead one square" do
      pawn.threat_deltas.should eq [[1, 1], [-1, 1]]
    end
  end
end
