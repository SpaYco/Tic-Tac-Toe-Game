# spec/main.rb

require './bin/main.rb'

RSpec.describe Game do
  let(:checker_game) { Game.new('SpaYco', 'Javier') }
  describe '#checker_game_on' do
    it "returns game still on if the game isn't finished." do
      expect(checker_game.method_checker_on).to eql('game still on')
    end
    it 'does not return tie if the game is still on' do
      expect(checker_game.method_checker_on).not_to eql('tie')
    end
    it 'does not return true if someone won' do
      expect(checker_game.method_checker_on).not_to eql(true)
    end
  end
  describe '#checker_game_won' do
    it "not return game still on if the game isn't finished." do
      expect(checker_game.method_checker_won).not_to eql('game still on')
    end
    it 'does not return tie if the game is still on' do
      expect(checker_game.method_checker_won).not_to eql('tie')
    end
    it 'returns true if someone won' do
      expect(checker_game.method_checker_won).to eql(true)
    end
  end
  describe '#checker_game_tie' do
    it "returns game still on if the game isn't finished." do
      expect(checker_game.method_checker_tie).not_to eql('game still on')
    end
    it 'returns tie if the game is still on' do
      expect(checker_game.method_checker_tie).to eql('tie')
    end
    it 'does not return true if someone won' do
      expect(checker_game.method_checker_tie).not_to eql(true)
    end
  end
  describe '#restart' do
    it 'stop the game when asked not to continue' do
      expect(checker_game.restart('n')).to eql('see you next time, goodbye!')
    end
  end
  describe '#board_reset' do
    it 'resets the board' do
      expect(checker_game.board_reset).to eql('board reset successfully')
    end
  end
end

RSpec.describe Board do
  let(:board) { Board.new }
  describe '#show' do
    it 'returns the board ' do
      expect(board.show).to eql("Here's your current board")
    end
  end
end

RSpec.describe String do
  describe '#red' do
    it 'returns string with red color' do
      expect('Hello World!'.red).to eql("\e[31mHello World!\e[0m")
    end
  end
  describe '#green' do
    it 'returns string with green color' do
      expect('Hello World!'.green).to eql("\e[32mHello World!\e[0m")
    end
  end
  describe '#blue' do
    it 'returns string with green color' do
      expect('Hello World!'.blue).to eql("\e[34mHello World!\e[0m")
    end
  end
  describe '#bg_gray' do
    it 'returns string with gray background color' do
      expect('Hello World!'.bg_gray).to eql("\e[47mHello World!\e[0m")
    end
  end
  describe '#bold' do
    it 'returns string bolded' do
      expect('Hello World!'.bold).to eql("\e[1mHello World!\e[22m")
    end
  end
  describe '#reverse_color' do
    it 'returns string with the reverse colors' do
      expect('Hello World!'.reverse_color).to eql("\e[7mHello World!\e[27m")
    end
  end
end
