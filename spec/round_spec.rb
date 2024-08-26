require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  it 'exists' do
    
    expect(@round).to be_instance_of(Round)
  end

  it 'has a deck' do
    
    expect(@round.deck).to eq(@deck)
  end

  it 'has turns' do
   
    expect(@round.turns).to eq([])
  end

  it 'has a current card' do
    
    expect(@round.current_card).to eq(@card_1)
  end

  it 'has a new turn with guess and card' do
    
    turn = @round.take_turn("Juneau")

    expect(turn).to be_instance_of(Turn)
    expect(turn.card).to eq(@card_1)
    expect(turn.guess).to eq("Juneau")
  end

  it 'adds guess to turns array' do
    
    turn = @round.take_turn("Juneau")

    expect(@round.turns.count).to eq(1)
  end

  it 'gives correct on correct' do
    
    turn = @round.take_turn("Juneau")

    expect(turn.feedback).to eq("Correct!")
  end

  it 'gives incorrect on incorrect' do
    
    turn = @round.take_turn("Helena")

    expect(turn.feedback).to eq("Incorrect!")
  end

  it 'tracks correct answers' do 
   
    turn = @round.take_turn("Juneau")

    expect(@round.number_correct).to eq (1)
  end

  it 'tracks incorrect answers' do
    
    turn = @round.take_turn("Helena")

    expect(@round.number_correct).to eq(0)
  end

  it 'counts correct by category' do
   
    turn = @round.take_turn("Juneau")
    turn = @round.take_turn("Venus")
    turn = @round.take_turn("North north west")

    expect(@round.number_correct_by_category(:Geography)).to eq(1)
    expect(@round.number_correct_by_category(:STEM)).to eq(1)
  end

  it 'calculates correct percentage' do
   
    turn = @round.take_turn("Juneau")
    turn = @round.take_turn("Venus")
    
    expect(@round.percent_correct).to eq(50.0)
  end

  it 'calculates percentage by category' do
    
    turn = @round.take_turn("Juneau")
    turn = @round.take_turn("Venus")
    

    expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
    expect(@round.percent_correct_by_category(:STEM)).to eq(0.0)
  end   

end