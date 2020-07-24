# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/AbcSize

class GameLogic
  attr_accessor :array

  def initialize(array = %w[a b c d e f g h i])
    @array = array
  end

  def validate_move(move)
    @arrays_key = { 'a' => 0, 'b' => 1, 'c' => 2, 'd' => 3, 'e' => 4, 'f' => 5, 'g' => 6, 'h' => 7, 'i' => 8 }
    @arrays_key.key?(move) ? @arrays_key[move] : 'No Valid'
  end

  def update_board(move, symbol)
    if @array[move] != 'X' && @array[move] != 'O'
      @array[move] = symbol
      true
    else
      false
    end
  end

  
  def winning?
    @win_cases = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    @win_cases.length.times do |element|
      condition1 = @array[@win_cases[element][1]] == @array[@win_cases[element][0]]
      condition2 = @array[@win_cases[element][1]] == @array[@win_cases[element][2]]
      return true if condition1 && condition2
    end
    return 'draw' if @array.none? { |position| %w[a b c d e f g h i].any?(position) }

    false
  end

  def winner(player1, player2)
    return player1.name if @array[0] == @array[1] && @array[1] == @array[2] && array[0] == player1.symbol
    return player1.name if @array[6] == @array[7] && @array[7] == @array[8] && array[6] == player1.symbol
    return player1.name if @array[3] == @array[4] && @array[4] == @array[5] && array[3] == player1.symbol
    return player1.name if @array[0] == @array[3] && @array[3] == @array[6] && array[0] == player1.symbol
    return player1.name if @array[1] == @array[4] && @array[4] == @array[7] && array[1] == player1.symbol
    return player1.name if @array[2] == @array[5] && @array[5] == @array[8] && array[2] == player1.symbol
    return player1.name if @array[0] == @array[4] && @array[4] == @array[8] && array[0] == player1.symbol
    return player1.name if @array[2] == @array[4] && @array[4] == @array[6] && array[2] == player1.symbol

    return player2.name if @array[6] == @array[7] && @array[7] == @array[8] && array[6] == player2.symbol
    return player2.name if @array[0] == @array[1] && @array[1] == @array[2] && array[0] == player2.symbol
    return player2.name if @array[3] == @array[4] && @array[4] == @array[5] && array[3] == player2.symbol
    return player2.name if @array[0] == @array[3] && @array[3] == @array[6] && array[0] == player2.symbol
    return player2.name if @array[1] == @array[4] && @array[4] == @array[7] && array[1] == player2.symbol
    return player2.name if @array[2] == @array[5] && @array[5] == @array[8] && array[2] == player2.symbol
    return player2.name if @array[0] == @array[4] && @array[4] == @array[8] && array[0] == player2.symbol
    return player2.name if @array[2] == @array[4] && @array[4] == @array[6] && array[2] == player2.symbol
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/AbcSize
