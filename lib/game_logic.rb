# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/AbcSize

class GameLogic
  attr_accessor :array

  def initialize(array = %w[a b c d e f g h i])
    @array = array
  end

  def welcome_message(name, symbol)
    puts "You are  welcome #{name}, Your symbol is #{symbol}"
  end

  def game_board()
    puts '-------------'
    puts "| #{@array[0]} | #{@array[1]} | #{@array[2]} |"
    puts '-------------'
    puts "| #{@array[3]} | #{@array[4]} | #{@array[5]} |"
    puts '-------------'
    puts "| #{@array[6]} | #{@array[7]} | #{@array[8]} |"
    puts '-------------'
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
      puts 'Move is Invalid'
      false
    end
  end

  def winning?
    return true if @array[0] == @array[1] && @array[1] == @array[2]
    return true if @array[3] == @array[4] && @array[4] == @array[5]
    return true if @array[6] == @array[7] && @array[7] == @array[8]
    return true if @array[0] == @array[3] && @array[3] == @array[6]
    return true if @array[1] == @array[4] && @array[4] == @array[7]
    return true if @array[2] == @array[5] && @array[5] == @array[8]
    return true if @array[0] == @array[4] && @array[4] == @array[8]
    return true if @array[2] == @array[4] && @array[4] == @array[6]
    return false if @array.none? { |position| %w[a b c d e f g h i].any?(position) }

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
