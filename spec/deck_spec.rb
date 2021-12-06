require './lib/deck'

RSpec.describe Deck do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    cards = [card_1]
    deck = Deck.new(cards)

    expect(deck).to be_instance_of(Deck)
  end

  it 'can count number of cards in deck' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.count).to eq(3)
  end

  it 'can sort cards based on given category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.count).to eq(3)
    expect(deck.cards_in_category(:STEM).length).to eq(2)
    expect(deck.cards_in_category(:Geography).length).to eq(1)
    expect(deck.cards_in_category("Pop Culture")).to eq([])
  end

  it 'can list categories being played in deck' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.count).to eq(3)
    expect(deck.categories_in_use).to eq([:Geography, :STEM])

    card_4 = Card.new("What sport is dubbed The King of Sports?", "Soccer", :Sports)
    card_5 = Card.new("Area 51 is located in which state?", "Nevada", :Geography)
    card_6 = Card.new("What is the national animal of Scotland?", "Unicorn", :Fun_Facts)
    card_7 = Card.new("Dump floater and wipe are terms used in which team sport?", "Volleyball", :Sports)
    card_8 = Card.new("Which country borders 14 nations and crosses 8 time zones?", "Russia", :Geography)
    card_9 = Card.new("Iceland diverted roads to avoid disturbing communities of what?", "Elves", :Fun_Facts)

    cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9]
    deck = Deck.new(cards)

    expect(deck.count).to eq(9)
    expect(deck.categories_in_use).to eq([:Fun_Facts, :Geography, :STEM, :Sports])

  end

end
