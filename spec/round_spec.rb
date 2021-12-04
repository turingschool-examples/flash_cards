require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  it 'is initialized with a deck' do
    expect(@round).to be_instance_of Round
  end

  it 'can return the deck of cards' do
    expect(@round.deck).to be @deck
    expect(@round.deck.cards.first).to be_instance_of Card
    expect(@round.deck.cards.last).to be_instance_of Card
  end

  it 'keeps track of previous turns' do
    expect(@round.turns).to be_instance_of Array
    expect(@round.turns).to be_empty
  end

  it 'can return the current card' do
    expect(@round.current_card).to be @card_1
  end


  describe '#take_turn' do
    before(:each) do
      @new_turn = @round.take_turn("Juneau")
    end
    it 'can take a turn' do
      expect(@new_turn).to be_instance_of Turn
    end
    it 'returns true if answer is correct' do
      expect(@new_turn.correct?).to be true
    end

    it 'returns false if answer is incorrect' do
      @new_turn = @round.take_turn('Venus')
      expect(@new_turn.correct?).to be false
    end
  it 'keeps track of previous turns' do
      expect(@round.turns).to eq [@new_turn]

      newer_turn = @round.take_turn("Venus")

      expect(@round.turns).to eq [@new_turn, newer_turn]
    end
  end

  describe '#number_correct and #number_correct_by_category' do
    before(:each) do
      @round.take_turn("Juneau")
      @round.take_turn("Venus")
    end

    it 'can return # of correct answers' do
      expect(@round.number_correct).to eq 1
    end
    
    it 'can return # of correct answers by category' do
      expect(@round.number_correct_by_category(:Geography)).to eq 1
      expect(@round.number_correct_by_category(:STEM)).to eq 0
    end
  end

  describe '#percent_correct and #percent_correct_by_category' do
    before(:each) do
      @round.take_turn("Juneau")
      @round.take_turn("Venus")
    end

    it 'calculates % of correct answers' do
      expect(@round.percent_correct).to be 50
    end

    it 'calculates % of correct answers by category' do
      expect(@round.percent_correct_by_category(:Geography)).to be 100
    end

    it 'calculates % of correct answers by category' do
      expect(@round.percent_correct_by_category(:STEM)).to be 0
    end
  end
end
