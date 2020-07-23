#!/usr/bin/env ruby
require_relative '../lib/players.rb'
require_relative '../lib/game_logic.rb'

game = GameLogic.new
puts 'Welcome to Tic Tac Toe'
puts 'Please Enter Your Name(First Player): '
player1 = Players.new(gets.chomp, 'X')
# save the name in player1 variable
# after entering the name we will agign the sign to player
game.welcome_message(player1.name, player1.symbol)
# puts "#{player1} your symbol is X "
puts 'Please Enter Your Name(Second Player): '
player2 = Players.new(gets.chomp, 'O')
# save the name in player2 variable
# after entering the name we will assign the sign to player
game.welcome_message(player2.name, player2.symbol)
test = false
while test == false
  loop do
    game.game_board
    puts "It is your move #{player1.name}, Select the position"
    move = gets.chomp
    validate_move = game.validate_move(move)
    if validate_move != 'No Valid'
      update_game_board = game.update_board(validate_move, 'X')
      puts 'Succesfull'
    else
      puts 'invalid input'
    end
    break if update_game_board == true
  end
  break if test == true
  loop do
    game.game_board
    puts "It is your move #{player2.name}, Select the position"
    move1 = gets.chomp
    validate_move1 = game.validate_move(move1)
    if validate_move1 != 'No Valid'
      update_game_board = game.update_board(validate_move1, 'O')
      puts 'Succesfull'
    else
      puts 'invalid input'
    end
    break if update_game_board == true
  end
end

# get the input
# check the validaity of input => pass the input in a method
# we will save the position and sign
# we will update the board and display it
# we will check the conditions

puts "It is your move #{player2.name}, Select the position"
# we will save the position and sign
# we will update the board and display it
# we will check the conditions

puts "player 'e.g player1' is the winner! or the game is draw"
puts 'do you want to rematch(y/n)? '
rematch = gets.chomp
puts rematch
# proceed depending on the user input either to terminate the game or rematch
