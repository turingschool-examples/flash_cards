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

    it 'had Round in Deck'do
        expect(@round.deck).to eq(@deck)
    end

    it 'takes empty turn array' do 
        expect(@round.turns).to be_empty 
    end

    it 'gives current card' do
        expect(@round.current_card).to eq(@card_1)
    end

    it 'takes turns' do 
        expect(@round.turns.count).to eq(0)
        new_turn = @round.take_turn("Juneau")
        expect(new_turn).to be_a(Turn)
        expect(@round.turns.count).to eq(1)
    end

    it 'is number of correct answers' do
        @round.take_turn("Juneau")
        @round.take_turn("Venus")
        expect(@round.number_correct).to eq(1)
    end

    it "returns the number of correct answers for a specific category" do
        @round.take_turn("Juneau")
        @round.take_turn("Mars")
        expect(@round.number_correct_by_category(:STEM)).to eq(1)
      end

    it 'gives % correct' do 
        @round.take_turn("Juneau")
        @round.take_turn("Venus")
        expect(@round.percent_correct).to eq(50.0)
    end

    it 'shows percent by category' do
         @round.take_turn("Juneau")
         @round.take_turn("Juneau")
         @round.take_turn("Juneau")
        expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
    end
end
