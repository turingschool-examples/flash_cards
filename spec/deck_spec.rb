require './lib/deck'

describe Deck do
  # prep all tests
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end
  # check initialization
  it 'exists' do
    expect(@deck).to be_instance_of(Deck)
  end
  #check for cards
  it 'has cards' do
    expect(@deck.cards).to eq(@cards)
  end

  # test the describe method
  describe '#count' do
    it 'can count' do
      # execute and assess
      expect(@deck.count).to eq(3)

      # try a second version
      cards = [@card_2, @card_1]
      deck = Deck.new(cards)
      expect(deck.count).to eq(2)
    end
  end

  # test the cards_in_category method
  describe '#cards_in_category' do
    it 'returns only cards of correct category' do
      # setup
      answer_1 = [@card_2, @card_3]
      answer_2 = [@card_1]
      # execute and assess
      expect(@deck.cards_in_category(:STEM)).to eq(answer_1)
    end
  end


end
