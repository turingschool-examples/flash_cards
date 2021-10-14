require './lib/round'

def create_test_deck
  card_1 = Card.new("What is 1 + 1?", "2", :Math)
  card_2 = Card.new("What is 50 + 20?", "70", :Math)
  card_3 = Card.new("What is 9 - 9?", "0", :Math)
  card_4 = Card.new("What is earth's gravity?", "9.8", :Science)
  card_5 = Card.new("Who came up with the Theory of Special Relativity?", "Albert Einstein", :Science)
  card_6 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  cards = [card_1, card_2, card_3, card_4, card_5, card_6]
  return Deck.new(cards)
end


RSpec.describe Round do

  it 'exists' do
    deck = create_test_deck
    round = Round.new(deck)
    expect(round).to be_instance_of(Round)
  end

  describe '#current_card' do
    it 'returns an instance of the Card class' do
      deck = create_test_deck
      round = Round.new(deck)
      expect(round.current_card).to be_instance_of(Card)
    end
  end

  describe '#take_turn' do
    it 'returns an instance of the Turn class' do
      deck = create_test_deck
      round = Round.new(deck)
      expect(round.take_turn('hello lol')).to be_instance_of(Turn)
    end
    it 'adds a turn to its respective round class' do
      deck = create_test_deck
      round = Round.new(deck)
      round.take_turn('hello lol')
      expect(round.turns.length).to eq(1)
    end
    it 'adds 1 to the current_card_index' do
      deck = create_test_deck
      round = Round.new(deck)
      round.take_turn('hello lol')
      expect(round.current_card_index).to eq(1)
    end
  end

end
