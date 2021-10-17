require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'


RSpec.describe CardGenerator do
  describe '#initialize' do
    it 'creates instance of class' do
      filename = "cards.txt"

      cards = CardGenerator.new(filename)

      expect(cards).to be_instance_of CardGenerator
    end

    it 'checks that card array was made' do
      filename = "cards.txt"

      cards = CardGenerator.new(filename)

      expect(cards.cards_array).to eq []
    end
  end

  describe '#cards' do # Test incomplete
    it 'creates card array' do
      filename = "cards.txt"

      cards = CardGenerator.new(filename).cards

      expect(cards).to be_instance_of Array

    end
  end

end
