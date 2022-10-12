require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

# require 'pry'; binding.pry

RSpec.describe Round do
  # exists
  it 'exists' do
    round = Round.new(1)

    expect(round).to be_a Round
  end

  it 'contains a deck' do
  # contains a deck
    card_1 = Card.new("Question1", "Answer1", :cat1)
    card_2 = Card.new("Question2", "Answer2", :cat1)
    card_3 = Card.new("Question3", "Answer3", :cat2)

    # cards = [card_1, card_2, card_3]

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    expect(round.deck).to eq deck
  end

  it 'has a turn counter, empty in beginning' do
  # contains turn counter
    card_1 = Card.new("Question1", "Answer1", :cat1)
    card_2 = Card.new("Question2", "Answer2", :cat1)
    card_3 = Card.new("Question3", "Answer3", :cat2)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    expect(round.turns).to eq []
  end

  it 'pulls current card (topdeck)' do
  # displays current card deck.cards[0] (clean this up)
    card_1 = Card.new("Question1", "Answer1", :cat1)
    card_2 = Card.new("Question2", "Answer2", :cat1)
    card_3 = Card.new("Question3", "Answer3", :cat2)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    expect(round.current_card).to eq card_1
  end

  # has new_turn method which is round.take_turn("guess")

  # new_turn is actually a Turn class? does that mean that occurs in turn.rb

  # new_turn can return .correct? (makes sense why it's in the turn class now)

  # logs number correct

  # discards card played during turn

  # displays new current card

  # take turn happens

  # a second turn is logged (.count = 2)

  # reveals correct or incorrect with round.turns.last.feedback

  # stores number correct by category

  # stores number correct

  # stores number correct by category

  # will display 3rd (final card) if 2 turns are taken

end
