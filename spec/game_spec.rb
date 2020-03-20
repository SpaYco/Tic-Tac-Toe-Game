# spec/enumerable_spec.rb

require './bin/main.rb'

RSpec.describe Game do
  describe '#cehcker_game_on' do
    it "returns game still on if the game isn't finished." do
      checker_game_on = Game.new('SpaYco', 'Javier')
      expect(checker_game_on.method_checker_on).to eql('game still on')
    end
    it "does not return tie if the game is still on" do
      checker_game_on = Game.new('SpaYco', 'Javier')
      expect(checker_game_on.method_checker_on).not_to eql('tie')
    end
    it 'does not return true if someone won' do
      checker_game_on = Game.new('SpaYco', 'Javier')
      expect(checker_game_on.method_checker_on).not_to eql(true)
    end
  end
  describe '#checker_game_won' do
    it "not return game still on if the game isn't finished." do
      checker_game_won = Game.new('SpaYco', 'Javier')
      expect(checker_game_won.method_checker_won).not_to eql('game still on')
    end
    it "does not return tie if the game is still on" do
      checker_game_won = Game.new('SpaYco', 'Javier')
      expect(checker_game_won.method_checker_won).not_to eql('tie')
    end
    it 'returns true if someone won' do
      checker_game_won = Game.new('SpaYco', 'Javier')
      expect(checker_game_won.method_checker_won).to eql(true)
    end
  end
  describe '#checker_game_tie' do
    it "returns game still on if the game isn't finished." do
      checker_game_tie = Game.new('SpaYco', 'Javier')
      expect(checker_game_tie.method_checker_tie).not_to eql('game still on')
    end
    it "returns tie if the game is still on" do
      checker_game_tie = Game.new('SpaYco', 'Javier')
      expect(checker_game_tie.method_checker_tie).to eql('tie')
    end
    it 'does not return true if someone won' do
      checker_game_tie = Game.new('SpaYco', 'Javier')
      expect(checker_game_tie.method_checker_tie).not_to eql(true)
    end
  end
  describe '#restart' do
    it "stop the game when asked not to continue" do
      game_restart = Game.new('SpaYco', 'Javier')
      expect(game_restart.restart('n')).to eql('see you next time, goodbye!')
    end
  end
  describe '#board_reset' do 
    it "resets the board" do
      game_reset = Game.new('SpaYco', 'Javier')
      expect(game_reset.board_reset).to eql('board reset successfully')
    end
  end
end
