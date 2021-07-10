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
      expect(card_generator.cards.first).to be_a Card 
      expect(card_generator.cards.last).to be_a Card 
    end
    
  end
end