require './lib/card_generator'

RSpec.describe CardGenerator do
  describe '#initialize' do 
    it 'exists' do
      cardgen = CardGenerator.new('cards.txt')

      expect(cardgen).to be_a(CardGenerator)
    end
  
    it 'reads a text file' do
      cardgen = CardGenerator.new('cards.txt')
      cardgen.generate_cards
      
    end
  end






end