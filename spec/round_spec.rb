require './lib/round'

RSpec.describe Round do
  before(:all) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  it 'exists' do
    expect(@round).to be_a(Round)
  end

  it 'has a deck' do
    expect(@round.deck).to be_a(Deck)
  end

  it 'has no turns by default' do
    expect(@round.turns).to eq([])
  end

  it 'has the deck first card as its first card' do
    expect(@round.current_card).to eq(@card_1)
  end

  it 'has turns as Turn objects' do
    new_turn = @round.take_turn("Juneau")
    expect(new_turn).to be_a(Turn)
  end

  it 'keeps track of turns' do
    expect(@round.turns.size).to eq(1)
  end

  it 'can add another turn' do
    @round.take_turn("Juneau")
    expect(@round.turns.count).to eq(2)
  end

  it 'knows total number correct' do
    expect(@round.number_correct).to eq(1)
  end

  it 'knows number correct by category' do
    expect(@round.number_correct_by_category(:Geography)).to eq(1)
    expect(@round.number_correct_by_category(:STEM)).to eq(0)
  end

  it 'knows the percent correct' do
    expect(@round.percent_correct).to eq(50.0)
  end

  it 'knows the percent correct by category' do
    expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
  end

  it 'keeps track of which card is the current card' do
    expect(@round.current_card).to eq(@card_3)
  end
end
