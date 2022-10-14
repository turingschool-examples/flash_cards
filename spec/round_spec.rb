require 'rspec'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

RSpec.describe Round do

  describe ("class round")

    it 'exists' do

      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(round).to be_instance_of(Round)
    end
  describe ("@turns")

    it 'has turns' do

      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(round.turns).to eq([])
    end

  describe ("#current_card")

    it "can describe currrent card" do

      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(round.current_card).to eq(card_1)
    end


  describe ("#take_turn")

    it 'can take turn' do

      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(round.take_turn("Juneau")).to eq(card_1)

    #xit 'can go to next card' do

    end

  describe ("#number_correct and #number_correct_by_category")

    it 'can count correct' do

      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)
      round.take_turn("Juneau")

      expect(round.number_correct).to eq(1)
      expect(round.number_correct_by_category(:Geography)).to eq(1)
    end

  describe ("#percent_correct and #percent_correct_by_category")
    it 'can show the percent correct' do

      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)
      round.take_turn("Juneau")

      expect(round.percent_correct).to eq(100)
      expect(round.percent_correct_category(:Geography)).to eq(100)
    end
  end
