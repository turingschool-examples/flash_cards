require './lib/card_generator'

describe CardGenerator do
  describe '#initialize' do
    it 'is an instance of CardGenerator' do
      card_generator = CardGenerator.new("cards.txt")

      expect(card_generator).to be_a CardGenerator
    end
  end



end
