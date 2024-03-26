# require './lib/card'
# require './lib/turn'
# require './lib/deck'
# require './lib/round'
require './lib/card_generator'
require './lib/cards.txt'

# need work
Rspec.describe Card_generator do

    it "is instance of Card_generator" do
        card_text = "cards.txt"
        new_cards = CardGenerator.new(card_text)
    expect(new_cards).to instance of CardGenerator
    end
end