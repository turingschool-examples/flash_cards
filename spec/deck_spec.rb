require './lib/card'
require './lib/deck'

RSpec.describe 'Deck Spec Harness' do
  before :each do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]

  end

  describe 'Iteration 2' do
    it '1. Deck Instantiation' do
      deck = Deck.new(@cards, 3)
      expect(deck).to be_an_instance_of(Deck)
    end

    it '2. deck_has_cards' do
      deck = Deck.new(@cards, 3)
      expect(deck.cards).to eq(@cards)
    end

    it '3. deck_count' do
      deck = Deck.new(@cards, 3)

      expect(deck.count).to eq(3)
    end



      # expect(@school1).to be_an_instance_of(School)
      #
      # expect(@school1).to respond_to(:start_time).with(0).argument
      # expect(@school1.start_time).to eq('9:00')
      # expect(@school2.start_time).to eq('10:00')
      #
      # expect(@school1).to respond_to(:hours_in_school_day).with(0).argument
      # expect(@school1.hours_in_school_day).to eq(7)
      # expect(@school2.hours_in_school_day).to eq(2)
      #
      # expect(@school1).to respond_to(:student_names).with(0).argument
      # expect(@school1.student_names).to eq([])
      # expect(@school2.student_names).to eq([])

  end
end
