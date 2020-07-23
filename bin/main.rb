#!/usr/bin/env ruby
require_relative '../lib/players.rb'
require_relative '../lib/game_logic.rb'

game = GameLogic.new
puts 'Welcome to Tic Tac Toe'
puts 'Please Enter Your Name(First Player): '
player1 = Players.new(gets.chomp, 'X')
game.welcome_message(player1.name, player1.symbol)
puts 'Please Enter Your Name(Second Player): '
player2 = Players.new(gets.chomp, 'O')
game.welcome_message(player2.name, player2.symbol)

rematch = true
while rematch == true
  while game.winning? == false
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
    break if game.winning?

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

  game.game_board
  if game.winning? && game.winning? != 'draw'
    puts "player #{game.winner(player1, player2)} is the winner!"
  else
    puts 'The game is draw'
  end
  puts 'do you want to rematch(y/n)? '

  # proceed depending on the user input either to terminate the game or rematch
  rematch = gets.chomp
  if rematch.casecmp('YES').zero?
    rematch = true
    game.array = %w[a b c d e f g h i]
  else
    rematch = false
    print 'Goodbye'
  end

end
