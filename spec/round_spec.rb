require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'rspec'

describe Round do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
    reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5°
      clockwise from due north?", "North north west", :STEM)
  cards = [card_1, card_2, card_3]
  deck = Deck.new(cards)

  it 'exists' do
    round = Round.new(deck)
    expect(round).to be_instance_of(Round)
  end


  it 'has a deck' do
      round = Round.new(deck)
    expect(round.deck).to eq(deck)
  end

  it 'starts with no turns' do
      round = Round.new(deck)
    expect(round.turns).to eq []
  end

  it 'can return current card' do
      round = Round.new(deck)
    expect(round.current_card).to eq(card_1)
  end
  describe 'can take a turn' do

    it 'can create a new turn' do
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      expect(new_turn).to be_instance_of(Turn)
    end
    it 'can check if guess is correct' do
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      expect(new_turn.correct?).to eq(true)
    end
    it 'can add to the list of turns taken' do
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      expect(round.turns).to eq([card_1])
    end

    describe '#number_correct' do
      xit 'can count the correct guesses' do
        round.take_turn("Juneau")

        expect(round.number_correct).to eq(1)
      end
    end
  end

end
