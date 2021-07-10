require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  it 'exist' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    #cards = [card_1, card_2, card_3]
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    expect(round).to be_instance_of(Round)
  end
  it 'has a deck' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    #cards = [card_1, card_2, card_3]
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    expect(round.deck).to eq(deck)
  end
  it 'takes a turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    #cards = [card_1, card_2, card_3]
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    expect(round.turns).to eq([])
  end
  it 'shows the current card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    #cards = [card_1, card_2, card_3]
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    expect(round.current_card).to eq(card_1)
  end
  it 'starts new turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    #cards = [card_1, card_2, card_3]
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn =round.take_turn("Juneau")
    expect(new_turn).to be_instance_of(Turn)
    expect(new_turn).to eq(round.turns.last)
  end
  it 'is in a class' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    #cards = [card_1, card_2, card_3]
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn =round.take_turn("Juneau")
    expect(new_turn.class).to eq(Turn)
  end
  it 'can evaluate if guess was correct' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    #cards = [card_1, card_2, card_3]
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn =round.take_turn("Juneau")
    expect(new_turn.correct?).to eq(true)
  end
  it 'can evauluate amount correct' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    #cards = [card_1, card_2, card_3]
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn =round.take_turn("Juneau")
    expect(round.number_correct).to eq(1)
  end
  it 'has a new current card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    #cards = [card_1, card_2, card_3]
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn =round.take_turn("Venus")
    expect(round.current_card).to eq(card_2)
  end
  it 'takes another' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    #cards = [card_1, card_2, card_3]
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn =round.take_turn("Juneau")
    new_turn =round.take_turn("Venus")
    expect(round.take_turn("Venus")).to eq(round.turns.last)
  end
  it 'can count number of cards' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    #cards = [card_1, card_2, card_3]
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn =round.take_turn("Juneau")
    new_turn =round.take_turn("Venus")
    expect(round.turns.count).to eq(2)
  end
end
