require './lib/card_generator'

RSpec.describe CardGenerator do
  describe '#initialize' do
    it 'exists' do
      cardgen = CardGenerator.new('cards.txt')

      expect(cardgen).to be_a(CardGenerator)
    end

    it 'creates appropriate number of cards from file' do
      cardgen = CardGenerator.new('cards.txt')

      expect(cardgen.cards.count).to eq(4)
    end

    it 'removes replaces space with _ in category symbol' do
      cardgen = CardGenerator.new('cards.txt')

      expect(cardgen.cards[1].category).to eq(:Turing_Staff)
    end
  end
end
