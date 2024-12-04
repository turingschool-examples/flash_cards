require './lib/turn'
require './lib/card'

RSpec.describe Card do
    it 'shows a flashcard' do
      card = Card.new("What is the capital of Alaska?")
      expect(card).to be_instance_of(Card)
    end

    it 