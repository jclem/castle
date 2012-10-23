class Castle::Piece
  attr_reader :color, :square
  attr_writer :position

  def initialize(color, square, position = nil)
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

  def self.from_fen(fen, square, position = nil)
    color = fen.upcase == fen ? :white : :black

    case fen
    when 'r', 'R'
      Castle::Piece::Rook.new(color, square)
    when 'n', 'N'
      Castle::Piece::Knight.new(color, square)
    when 'b', 'B'
      Castle::Piece::Bishop.new(color, square)
    when 'q', 'Q'
      Castle::Piece::Queen.new(color, square)
    when 'k', 'K'
      Castle::Piece::King.new(color, square)
    when 'p', 'P'
      Castle::Piece::Pawn.new(color, square)
    end
  end
end
