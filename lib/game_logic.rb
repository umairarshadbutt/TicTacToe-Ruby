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
    @players = [player1, player2]
    @players.each do |player|
      return player.name if @win_cases.any? { |item| item.all? { |position| @array[position] == player.symbol } }
    end
  end
end
