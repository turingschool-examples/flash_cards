require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do

#set up my test suite with the creation of a basic deck
  before do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  describe "#initialize" do
  #vet that the round initialize method works correctly
    it 'creates a deck' do
      expect(@round.deck).to eq(@deck)
    end
    it 'starts with an empty turns array' do
      expect(@round.turns).to eq([])
    end
    it 'sets current_card to first card in the deck' do
      expect(@round.current_card).to eq(@card_1)
    end
  end

  describe "#take_turn" do
  #vet that the take_turn method works correctly
    it 'creates a new Turn object' do
      new_turn = @round.take_turn("Juneau")
      expect(new_turn.class).to eq(Turn)
    end
    it 'stores new Turn object in round.turns array' do
      new_turn = @round.take_turn("Juneau")
      expect(@round.turns).to include(new_turn)
      new_turn_2 =  @round.take_turn("Venus")
      expect(@round.turns).to include(new_turn_2)
    end
    it 'advances to the next card after a turn' do
      new_turn = @round.take_turn("Juneau")
      new_turn_2 = @round.take_turn("Venus")
      new_turn_3 = @round.take_turn("Cheetos")
      expect(@round.current_card).to eq(@card_3)
    end
    #vet that upon running take_turn method
    describe "#evaluate_correctness" do
      it 'counts the number of correct responses' do
        new_turn = @round.take_turn("Juneau")
        new_turn_2 = @round.take_turn("Mars")
        new_turn_3 = @round.take_turn("Cheetos")
        expect(@round.number_correct).to eq(2)
      end
    end
  end
  describe "#number_correct_by_category" do
    it 'counts the number of correct responses by category' do
      new_turn = @round.take_turn("Juneau")
      new_turn_2 = @round.take_turn("Mars")
      new_turn_3 = @round.take_turn("Cheetos")
      expect(@round.number_correct_by_category(:Geography)).to eq (1)
      expect(@round.number_correct_by_category(:STEM)).to eq (1)
    end
  end
  describe "#percent_correct" do
    it 'reports the percentage of correct responses' do
      new_turn = @round.take_turn("Juneau")
      new_turn_2 = @round.take_turn("Venus")
      expect(@round.percent_correct).to eq (50.0)
    end
  end
  describe "#percent_correct_by_category" do
    it 'reports the percentage of correct responses by category' do
      new_turn = @round.take_turn("Juneau")
      new_turn_2 = @round.take_turn("Venus")
      expect(@round.percent_correct_by_category(:Geography)).to eq (100.0)
    end
  end
end



#QUESTIONS

# what is better, to have less code in a method and
# reference other methods that contains more code,
# or to have all the code you need in one method
# commented out?
#
# review examples of multiple expectations in a
# single test. Ex: 'stores new Turn object in round.turns array'
