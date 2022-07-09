require './lib/card_generator'
require './lib/card'

RSpec.describe CardGenerator do
  before do
    filename = "cards.txt"
    @card_generator = CardGenerator.new(filename)
  end

    describe '#initialize' do
      it 'should initialize an instance of CardGenerator' do
        expect(@card_generator).to be_instance_of(CardGenerator)
      end
    end

      it 'has an array of cards' do
        expect(@card_generator.cards).to be_an Array
      end 
end
