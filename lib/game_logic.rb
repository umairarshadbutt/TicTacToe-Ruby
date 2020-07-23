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
      puts 'Move is Invalid'
      false
    end
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
end
