#!/usr/bin/env ruby
require_relative '../lib/players.rb'
require_relative '../lib/game_logic.rb'
def welcome_message(name, symbol)
  puts "You are  welcome #{name}, Your symbol is #{symbol}"
end

game = GameLogic.new

game.array = %w[a b c d e f g h i]
def game_board(board_array = game.array)
  puts '-------------'
  puts "| #{board_array[0]} | #{board_array[1]} | #{board_array[2]} |"
  puts '-------------'
  puts "| #{board_array[3]} | #{board_array[4]} | #{board_array[5]} |"
  puts '-------------'
  puts "| #{board_array[6]} | #{board_array[7]} | #{board_array[8]} |"
  puts '-------------'
end
puts 'Welcome to Tic Tac Toe'
puts 'Please Enter Your Name(First Player): '
player1 = Players.new(gets.chomp, 'X')
welcome_message(player1.name, player1.symbol)
puts 'Please Enter Your Name(Second Player): '
player2 = Players.new(gets.chomp, 'O')
welcome_message(player2.name, player2.symbol)

players = [player1, player2]
rematch = true
while rematch == true
  while game.winning? == false
    players.each do |player|
      loop do
        game_board(game.array)
        puts "It is your move #{player.name}, Select the position"
        move = gets.chomp
        validate_move = game.validate_move(move)
        if validate_move != 'No Valid'
          update_game_board = game.update_board(validate_move, player.symbol)
          puts 'Succesfull'
        else
          puts 'invalid input'
        end
        break if update_game_board == true
      end
      break if game.winning?
    end
  end

  game_board(game.array)
  if game.winning? && game.winning? != 'draw'
    puts "player #{game.winner(player1, player2)} is the winner!"
  else
    puts 'The game is draw'
  end
  puts 'do you want to rematch(y/n)? '

  rematch = gets.chomp
  if rematch.casecmp('YES').zero?
    rematch = true
    game.array = %w[a b c d e f g h i]
  else
    rematch = false
    puts 'Goodbye'
  end

end
