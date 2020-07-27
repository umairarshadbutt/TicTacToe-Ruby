require_relative '../lib/game_logic.rb'
require_relative '../lib/players.rb'

describe 'Tictactoe' do
  game = GameLogic.new
  # player1 = Players.new("Elias", 'X')
  # player2 = Players.new("Umair", 'O')

  # game.array = %w[a b c d e f g h i]

  describe 'validate move' do
    it 'Validates if the place exists and if it is not taken already' do
      expect(game.validate_move('a')).to eql(0)
    end
    it 'Validates if the place exists and if it is not taken already' do
      expect(game.validate_move('b')).to eql(1)
    end
  end

  describe 'update_board' do
    it 'Assigns the X to board position a' do
      expect(game.update_board(0, 'X')).to eql(true)
    end
    it 'Assigns the X to board position b' do
      expect(game.update_board(1, 'X')).to eql(true)
    end
    it 'Assigns the X to board position c' do
      expect(game.update_board(2, 'X')).to eql(true)
    end
  end

  describe 'winning?' do
    it 'Game wining condition is true' do
      expect(game.winning?).to eql(true)
    end
  end
end
