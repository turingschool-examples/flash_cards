require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  before :each do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  it 'can recognise round as instance of class' do
    expect(@round).to be_instance_of(Round)
  end

  it 'can utilize turns' do
    @round.deck
    expect(@round.turns).to eq([])
    @round.current_card

    new_turn = @round.take_turn("Juneau")

    expect(new_turn.class).to eq(Turn)
    expect(new_turn.correct?).to eq(true)
    @round.turns

  end

  it 'can count turns and access last turn' do
    @round.deck
    expect(@round.turns).to eq([])
    @round.current_card

    new_turn = @round.take_turn("Juneau")

    expect(new_turn.class).to eq(Turn)
    expect(new_turn.correct?).to eq(true)
    @round.turns
    @round.current_card

    @round.take_turn("Venus")

    expect(@round.turns.count).to eq(2)
    expect(@round.turns.last.feedback).to eq("Incorrect.")
  end

  it 'can return number correct by category and percent correct' do
   @round.deck
   expect(@round.turns).to eq([])
   @round.current_card
   new_turn = @round.take_turn("Juneau")
   expect(@round.number_correct).to eq(1)
   @round.turns

   @round.current_card

   @round.take_turn("Venus")

   expect(@round.turns.count).to eq(2)
   expect(@round.turns.last.feedback).to eq("Incorrect.")
   expect(@round.number_correct).to eq(1)
   expect(@round.number_correct_by_category(:Geography)).to eq(1)
   expect(@round.number_correct_by_category(:STEM)).to eq(0)
   expect(@round.percent_correct).to eq(50.0)
   expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)

   @round.current_card
 end


end
