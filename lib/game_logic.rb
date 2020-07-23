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
end
