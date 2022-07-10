require './lib/card_generator'

describe CardGenerator do

it do 
    cards = CardGenerator.new(cards).cards
expect(card_generator.cards).to all(be_instance_of(Card))
expect(card_generator.cards.first.question).to eq("What is 5 + 5?")

end

end 