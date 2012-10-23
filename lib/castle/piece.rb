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

  def square(format = nil)
    case format
    when :algebraic
      file = %w[a b c d e f g h][square[0]]
      rank = square[1] + 1
      "#{file}#{rank}".to_sym
    else
      @square
    end
  end

  def self.from_fen(fen, square)
    case fen
    when 'r'
      Castle::Piece::Rook.new(:black, square)
    when 'n'
      Castle::Piece::Knight.new(:black, square)
    when 'b'
      Castle::Piece::Bishop.new(:black, square)
    when 'q'
      Castle::Piece::Queen.new(:black, square)
    when 'k'
      Castle::Piece::King.new(:black, square)
    when 'p'
      Castle::Piece::Pawn.new(:black, square)
    when 'R'
      Castle::Piece::Rook.new(:white, square)
    when 'N'
      Castle::Piece::Knight.new(:white, square)
    when 'B'
      Castle::Piece::Bishop.new(:white, square)
    when 'Q'
      Castle::Piece::Queen.new(:white, square)
    when 'K'
      Castle::Piece::King.new(:white, square)
    when 'P'
      Castle::Piece::Pawn.new(:white, square)
    end
  end
end
