require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/gameplay'

RSpec.describe Gameplay do
  it 'exists' do
    card_1 = Card.new("Is cereal soup?", "No", :Food)
    card_2 = Card.new("Is a hotdog a sandwhich?", "Yes", :Food)
    card_3 = Card.new("Toilet paper, over or under?", "Over", :Trivia)
    card_4 = Card.new("Who would win a fight between Superman and Batman?", "Superman", :Trivia)

    cards = [card_1, card_2, card_3, card_4]
    deck = Deck.new(cards)
    round = Round.new(deck)
    gameplay = Gameplay.new(round)

    expect(gameplay).to be_a(Gameplay)
  end
end
