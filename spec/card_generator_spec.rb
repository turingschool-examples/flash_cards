require './lib/card_generator'
require './lib/card'

RSpec.describe CardGenerator do
    it 'is a card generator'

    filename = cards.txt

    card_generator = CardGenerator.new(filename).cards

    expect(card_generator).to be_instance_of(CardGenerator)
end