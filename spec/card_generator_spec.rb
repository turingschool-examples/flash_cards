require './lib/card_generator'


RSpec.describe CardGenerator do
  context 'initialize' do
    filename = "cards.txt"
    card_generator = CardGenerator.new(filename)
    
    it 'exists' do
      expect(card_generator).to be_a CardGenerator
    end

    it '.cards is an array' do  
      expect(card_generator.cards).to be_an Array
    end

    it '.cards is an array with cards' do 
      card_generator.generate_cards
      expect(card_generator.cards).to_not be_empty
      card_generator.cards.each do |card|
        expect(card).to be_a Card 
      end
      card_generator.cards = []
    end

    it 'can create 6 cards' do 
      expect(card_generator.cards).to be_empty
      card_generator.generate_cards
      expect(card_generator.cards.length).to eq(6)
      card_generator.cards = []
    end
  end
end