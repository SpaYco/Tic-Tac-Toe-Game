# spec/enumerable_spec.rb

require './bin/main.rb'

RSpec.describe Game do
  describe '#cehcker' do
    it "returns game still on if the game isn't finished" do
      checker_game_on = Game.new('SpaYco', 'Javier')
      expect(checker_game_on.method_checker_on).to eql('game still on')
    end
    it 'returns true if someone won' do
      checker_game_won = Game.new('SpaYco', 'Javier')
      expect(checker_game_won.method_checker_won).to eql(true)
    end
    it "returns tie if it's a tie" do
      checker_game_tie = Game.new('SpaYco', 'Javier')
      expect(checker_game_tie.method_checker_tie).to eql('tie')
    end
  end
end
