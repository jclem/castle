require 'spec_helper'

describe Castle::Position do
  let(:position) { Castle::Position.new }

  describe "#initialize" do
    context "when given a FEN" do
      let(:fen) { 'rnbqkbnr/pppppppp/8/8/8/4P3/PPPP1PPP/RNBQKBNR w KQkq - 0 1'}
      let(:position) { Castle::Position.new(fen) }

      it "sets that as its FEN" do
        position.fen.should eq fen
      end
    end

    context "when not given a FEN" do
      let(:position) { Castle::Position.new }

      it "uses the default position" do
        position.fen.should eq Castle::START_POSITION_FEN
      end
    end

    it "creates a piece for each piece on its board" do
      position.pieces.count.should eq 32
    end
  end
end
