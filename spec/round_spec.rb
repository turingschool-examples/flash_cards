require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'


RSpec.describe Round do
  it 'exits' do
    card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
    card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
    card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
    card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
    card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
    cards = [card1, card2, card3, card4, card5]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round).to be_instance_of(Round)
  end

  describe '#initialize' do
    it "has a deck" do
      card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
      card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
      card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
      card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
      card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
      cards = [card1, card2, card3, card4, card5]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round.deck).to eq(deck)
    end

    it "starts with no cards turned" do
      card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
      card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
      card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
      card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
      card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
      cards = [card1, card2, card3, card4, card5]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round.turns).to eq([])
    end

    it 'starts at the first card of the deck' do
      card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
      card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
      card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
      card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
      card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
      cards = [card1, card2, card3, card4, card5]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round.current_card).to eq(cards[0])
    end
  end

  describe '#take_turn' do
    it 'can take and store a turn' do
      card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
      card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
      card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
      card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
      card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
      cards = [card1, card2, card3, card4, card5]
      deck = Deck.new(cards)
      round = Round.new(deck)

      new_turn = round.take_turn("Denver")
  # require "pry"; binding.pry
      expect(new_turn.class).to eq(Turn)
      expect(new_turn.correct?).to eq(true)
      expect(round.turns[0].card).to eq(cards[0])
    end

    it 'fills the turns array as turns are taken' do
      card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
      card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
      card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
      card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
      card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
      cards = [card1, card2, card3, card4, card5]
      deck = Deck.new(cards)
      round = Round.new(deck)

      round.take_turn('Denver')
      round.take_turn('Mexico City')
      actual = round.turns.count

      expect(actual).to eq(2)
    end
  end

  describe '#number_correct' do
    it 'can calculate how many turns were correct' do
      card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
      card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
      card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
      card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
      card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
      cards = [card1, card2, card3, card4, card5]
      deck = Deck.new(cards)
      round = Round.new(deck)

      round.take_turn('Denver')

      expect(round.number_correct).to eq(1)
    end
  end

  describe '#current_card' do
    it 'knows the information of the current card' do
      card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
      card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
      card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
      card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
      card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
      cards = [card1, card2, card3, card4, card5]
      deck = Deck.new(cards)
      round = Round.new(deck)

      actual = round.current_card

      expect(actual).to eq(card1)
    end

    it 'still knows current card after taking a turn' do
      card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
      card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
      card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
      card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
      card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
      cards = [card1, card2, card3, card4, card5]
      deck = Deck.new(cards)
      round = Round.new(deck)

      round.take_turn('Denver')
      actual = round.current_card

      expect(actual).to eq(card2)
    end
  end

  describe '#number_correct_by_category' do
    it 'knows how many cards of a category it has' do
      card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
      card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
      card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
      card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
      card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
      cards = [card1, card2, card3, card4, card5]
      deck = Deck.new(cards)
      round = Round.new(deck)

      round.take_turn('Denver')
      round.take_turn('Mexico City')

      actual = round.number_correct_by_category(:Geography)

      expect(actual).to eq(2)
    end

    it 'does not count categories that it does not contain' do
      card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
      card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
      card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
      card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
      card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
      cards = [card1, card2, card3, card4, card5]
      deck = Deck.new(cards)
      round = Round.new(deck)

      actual = round.number_correct_by_category(:People)

      expect(actual).to eq(0)
    end
  end

  describe '#percent_correct' do
    it 'tells you what percentage of your guesses are correct' do
      card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
      card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
      card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
      card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
      card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
      cards = [card1, card2, card3, card4, card5]
      deck = Deck.new(cards)
      round = Round.new(deck)

      round.take_turn('Denver')
      round.take_turn('Mexico City')
      actual = round.percent_correct

      expect(actual).to eq(100)
    end

    it 'tells you when you get some of them wrong' do
      card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
      card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
      card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
      card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
      card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
      cards = [card1, card2, card3, card4, card5]
      deck = Deck.new(cards)
      round = Round.new(deck)

      round.take_turn('Denver')
      round.take_turn('Tulum')
      actual = round.percent_correct
      # require "pry"; binding.pry

      expect(actual).to eq(50)
    end

    it 'wont explode if have not taken any turns' do
      card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
      card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
      card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
      card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
      card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
      cards = [card1, card2, card3, card4, card5]
      deck = Deck.new(cards)
      round = Round.new(deck)

      actual = round.percent_correct
      # require "pry"; binding.pry

      expect(actual).to eq("error divide by zero")
    end
  end

  describe '#percent_correct_by_category' do
    it 'can tell you what percent of a category have correct guesses' do
      card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
      card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
      card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
      card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
      card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
      cards = [card1, card2, card3, card4, card5]
      deck = Deck.new(cards)
      round = Round.new(deck)

      round.take_turn('Denver')
      round.take_turn('Mexico City')
      actual = round.percent_correct_by_category(:Geography)

      expect(actual).to eq(100)
    end

    it 'still gives you the correct percent if you get some wrong' do
      card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
      card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
      card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
      card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
      card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
      cards = [card1, card2, card3, card4, card5]
      deck = Deck.new(cards)
      round = Round.new(deck)

      round.take_turn('Denver')
      round.take_turn('No idea')
      actual = round.percent_correct_by_category(:Geography)

      expect(actual).to eq(50)
    end

    it 'wont divide by zero if no cards of that category have been turned' do
      card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
      card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
      card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
      card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
      card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
      cards = [card1, card2, card3, card4, card5]
      deck = Deck.new(cards)
      round = Round.new(deck)

      round.take_turn('Denver')
      round.take_turn('No idea')
      actual = round.percent_correct_by_category(:Sports)

      expect(actual).to eq("error divide by zero")
    end
  end
end
