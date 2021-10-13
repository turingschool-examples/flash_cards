require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

describe Round do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  it "exists" do
    expect(@round).to be_an_instance_of(Round)
  end

  it "#deck" do
    expect(@round.deck).to eq(@deck)
  end

  it "#turns" do
    expect(@round.turns).to eq([])
  end

  it "#current_card" do
    expect(@round.current_card).to eq(@card_1)
  end

  describe 'new turns' do
    before(:each) do
      @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      @deck = Deck.new([@card_1, @card_2, @card_3])
      # @turn1 = Turn.new("Juneau", @card_1)
      # @turn2 = Turn.new("Saturn", @card_2)
      @round = Round.new(@deck)
    end

    it "#take_turn" do
      new_turn = @round.take_turn("Juneau")

      expect(new_turn.class).to eq(Turn)
      expect(@round.turns).to eq([new_turn])
    end

    it "#correct?" do
      new_turn = @round.take_turn("Juneau")

      expect(new_turn.correct?).to eq(true)
    end

    it "#number_correct" do
      @round.take_turn("Juneau")

      expect(@round.number_correct).to eq(1)
    end

    it "#current_card" do
      @round.take_turn("Juneau")

      expect(@round.current_card).to eq(@card_2)
    end

    it "can keep track of the number of turns taken" do
      @round.take_turn("Juneau")

      expect(@round.turns.count).to eq(1)

      @round.take_turn("Venus")

      expect(@round.turns.count).to eq(2)
    end

    it "can get the feedback for the last turn and keep number of correct answers" do
      @round.take_turn("Juneau")
      @round.take_turn("Venus")

      expect(@round.turns.last.feedback).to eq("Incorrect.")
      expect(@round.number_correct).to eq(1)
    end

    it "#number_correct_by_category" do
      @round.take_turn("Juneau")
      @round.take_turn("Venus")

      expect(@round.number_correct_by_category(:Geography)).to eq(1)
      expect(@round.number_correct_by_category(:STEM)).to eq(0)
    end

    it "#percent_correct" do
      @round.take_turn("Juneau")
      @round.take_turn("Venus")

      expect(@round.percent_correct).to eq(50.0)
    end

    it "#percent_correct_by_category" do
      @round.take_turn("Juneau")
      @round.take_turn("Venus")

      expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
      expect(@round.current_card).to eq(@card_3)
    end
  end
end
