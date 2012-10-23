class Castle::Position
  attr_accessor :fen
  attr_reader :pieces

  def initialize(fen = Castle::START_POSITION_FEN)
    @fen = fen
    @pieces = []

    create_pieces
  end

private

  def create_pieces
    ranks.reverse.each_with_index do |rank, rank_index|
      file = 0

      rank.split('').each_with_index do |fen_piece, index|
        if fen_piece.to_i > 0
          file += fen_piece.to_i
          next
        else
          @pieces << Castle::Piece.from_fen(fen_piece, [file, rank_index], self)
          file += 1
        end
      end
    end
  end

  def ranks
    @ranks ||= @fen.split(' ')[0].split('/')
  end
end
