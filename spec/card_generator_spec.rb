require './lib/card_generator'

RSpec.describe CardGenerator do
  describe 'initialize' do
    it 'creates and instance of CardGenerator' do
      filename = cards.txt
      card_generator = CardGenerator.new(filename)

      expect(card_generator).to be_instance_of(CardGenerator)
    end
  end

  describe '' do
    xit 'can create cards from text file' do
      expect(card_generator.cards).to eq 
    end
  end
end
