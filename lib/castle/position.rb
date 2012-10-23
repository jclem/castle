class Castle::Position
  attr_accessor :fen

  def initialize(fen = Castle::START_POSITION_FEN)
    @fen = fen
  end
end
