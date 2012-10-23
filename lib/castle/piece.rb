class Castle::Piece
  attr_reader :color, :square

  def initialize(color, square)
    @color = color
    @square = square
  end

  def has_moved
    @has_moved = true
  end

  def has_moved?
    @has_moved
  end

  def self.from_fen(fen, square)
    case fen
    when 'P'
      Castle::Piece::Pawn.new(:white, square)
    when 'p'
      Castle::Piece::Pawn.new(:black, square)
    end
  end
end
