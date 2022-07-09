require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  before :each do
  @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

  @deck =Deck.new([@card_1, @card_2, @card_3])
  @round = Round.new(@deck)
  end

  it 'exists' do
    expect(@round).to be_a(Round)
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

  it 'can take a new turn' do
    @new_turn = @round.take_turn("Juneau")

    expect(@new_turn.class).to eq(Turn)
  end

  it 'turn is correct?' do

    @new_turn = @round.take_turn("Juneau")
    expect(@new_turn.correct?).to eq(true)
  end

  it 'has turns' do

    @new_turn = @round.take_turn("Juneau")
    expect(@round.turns).to eq([@new_turn])
  end

  it 'keep track of number correct' do
    @round.take_turn("Juneau")

    expect(@round.turns.count).to eq(1)
  end

  it 'know current card for round' do
    @round.take_turn("Juneau")
    expect(@round.current_card).to eq(@card_2)
  end


  it 'can take another turn' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    expect(@round.turns.count).to eq(2)
    expect(@round.turns.last.feedback).to eq("Incorrect.")
  end

  it 'can return number correct by category' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    expect(@round.number_correct_by_category(:Geography)).to eq(1)
    expect(@round.number_correct_by_category(:STEM)).to eq(0)
  end

  it 'can return percent correct of turns' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    expect(@round.percent_correct).to eq(50)
  end

  it 'can return percent correct by category' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
  end
end
