require './lib/round'

RSpec.describe Round do
  it 'exists' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("1 + 1", "2", :Math)
    card3 = Card.new("1 * 1", "1", :Math)
    deck = Deck.new([card1,card2,card3])
    round = Round.new(deck)
    expect(round).to be_instance_of(Round)
  end

  it 'has a deck' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("1 + 1", "2", :Math)
    card3 = Card.new("1 * 1", "1", :Math)
    deck = Deck.new([card1,card2,card3])
    round = Round.new(deck)
    expect(round.current_card).to eq(card1)
    expect(round.deck).to eq(deck)
  end

  it 'takes turns' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("1 + 1", "2", :Math)
    card3 = Card.new("1 * 1", "1", :Math)
    deck = Deck.new([card1,card2,card3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    expect(new_turn).to be_instance_of(Turn)
    expect(round.correct).to eq(true)
    
  end

end
