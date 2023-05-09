require './lib/round'
require './lib/deck'
require './lib/turn'
require './lib/card'

RSpec.describe Round do
  it 'is an instance of' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round).to be_an_instance_of(Round)
  end

  it 'has a deck' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.deck).to eq deck
  end

  it 'can have a different deck' do
    card_1 = Card.new("What my favorite food?", "Zhu Rou Fan", :cuisine)
    card_2 = Card.new("Who created the Ruby programming language?", "Mars", :programming)
    card_3 = Card.new("What year was the original movie The Wizard of OZ released?", 1939, :cenima)
    cards = [card_1, card_2, card_3]
    deck1 = Deck.new(cards)
    round = Round.new(deck1)

    expect(round.deck).to eq deck1
  end

  it 'has method to show top card of deck' do
    card_1 = Card.new("What my favorite food?", "Zhu Rou Fan", :cuisine)
    card_2 = Card.new("Who created the Ruby programming language?", "Mars", :programming)
    card_3 = Card.new("What year was the original movie The Wizard of OZ released?", 1939, :cenima)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.current_card).to eq card_1
  end

  it 'has method to take a turn' do
    card_1 = Card.new("What my favorite food?", "Zhu Rou Fan", :cuisine)
    card_2 = Card.new("Who created the Ruby programming language?", "Mars", :programming)
    card_3 = Card.new("What year was the original movie The Wizard of OZ released?", 1939, :cenima)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    new_turn = round.take_turn("Zhu Rou Fan")
    expect(new_turn).to be_an_instance_of(Turn) 
    expect(new_turn.correct?).to eq true
  end

  it 'has has an array to keep turns' do
    card_1 = Card.new("What my favorite food?", "Zhu Rou Fan", :cuisine)
    card_2 = Card.new("Who created the Ruby programming language?", "Mars", :programming)
    card_3 = Card.new("What year was the original movie The Wizard of OZ released?", 1939, :cenima)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.turns).to eq([])
    turn_1 = round.take_turn("Pizza")
    turn_2 = round.take_turn("Zhu Rou Fan")

    expect(round.turns).to eq([turn_1,turn_2])
  end

  it 'has access to turn class method .correct?' do
    card_1 = Card.new("What my favorite food?", "Zhu Rou Fan", :cuisine)
    card_2 = Card.new("Who created the Ruby programming language?", "Mars", :programming)
    card_3 = Card.new("What year was the original movie The Wizard of OZ released?", 1939, :cenima)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    turn_1 = round.take_turn("Pizza")
    expect(turn_1.correct?).to eq false
    turn_2 = round.take_turn("Zhu Rou Fan")
    expect(turn_2.correct?).to eq true
  end

  xit 'moves on to the next card in the deck' do
    card_1 = Card.new("What my favorite food?", "Zhu Rou Fan", :cuisine)
    card_2 = Card.new("Who created the Ruby programming language?", "Mars", :programming)
    card_3 = Card.new("What year was the original movie The Wizard of OZ released?", 1939, :cenima)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.current_card).to eq card_1
    turn_1 = round.take_turn("Pizza")
    expect(round.current_card).to eq card_2
  end
end