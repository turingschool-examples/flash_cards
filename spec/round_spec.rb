require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe do

  describe '#class foundation' do

  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)


    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    expect(round).to be_instance_of(Round)

  end

end

  describe '#deck method' do
    it 'returns the deck the Round class is usuing'do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)


      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      expect(round.deck).to eq(deck)

    end
  end

  describe '#turns method' do
    it 'will tell you show you the turns you have completed' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)


      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      expect(round.turns).to eq([])

    end


  end

  describe '#current_card' do
    it 'will tell you the current card you are on' do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)


    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    expect(round.current_card).to eq(card_1)

    end

  end

  describe '#take_turn()' do
    it 'creates a new instance of the turn class' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)



      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")


      expect(new_turn).to be_instance_of(Turn)


    end
  end

  describe 'number_correct_by_category' do
    it 'Will tell you how many turns are correct by category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      new_turn_1 = round.take_turn("Juneau")
      new_turn_2 = round.take_turn("Saturn")
      new_turn_3 = round.take_turn("Blues Clues")


      expect(round.number_correct_by_category(:Geography)).to eq(1)
      expect(round.number_correct_by_category(:STEM)).to eq(0)
    end
  end

  describe '#percent_correct' do
    it 'will calculate the percent correct' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      deck = Deck.new([card_1, card_2, card_3])

      round = Round.new(deck)

      new_turn_1 = round.take_turn("Juneau")
      new_turn_2 = round.take_turn("Saturn")
      new_turn_3 = round.take_turn("Blues Clues")

      expect(round.percent_correct).to eq(33.3)

    end
  end

  describe '#percent_correct_by_category()' do
    it 'will calculate the percent correct based on the category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]

      deck = Deck.new(cards)

      round = Round.new(deck)

      new_turn_1 = round.take_turn("Juneau")
      new_turn_2 = round.take_turn("Saturn")
      new_turn_3 = round.take_turn("Blues Clues")

      expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
      expect(round.percent_correct_by_category(:STEM)).to eq(0.0)

    end

  end








end
