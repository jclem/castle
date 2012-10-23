class Castle::Piece::Pawn < Castle::Piece
  def name
    'pawn'
  end

  def move_deltas
    if has_moved?
      [[0, 1]]
    else
      [[0, 1], [0, 2]]
    end
  end

  def threat_deltas
    [[1, 1], [-1, 1]]
  end
end
