require_relative '../lib/game_logic.rb'
require_relative '../lib/players.rb'

describe Tictactoe do
  game = GameLogic.new
  game.array = %w[a b c d e f g h i]

  describe 'update_board' do
    it 'Assign the X to boar' do
      expect(game.update_board('a', 'X')).to eql(true)
    end
  end
end
