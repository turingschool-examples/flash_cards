Dir['./lib/*.rb'].each {|file| require file }

RSpec.describe Round do
  before(:each) do
    @test_cards = [
      Card.new("What is the capital of Alaska?", "Juneau", :Geography),
      Card.new("When did world war 2 end?", "Sep 2, 1945", :History),
      Card.new("What is the square root of 25?", "5", :Math),
      Card.new("What is the square root of 144?", "12", :Math)
    ]
    @test_deck = Deck.new(@test_cards)
    @test_round = Round.new(@test_deck)
  end

  it 'exists' do
    expect(@test_round).to be_instance_of(Round)
  end

  it 'has a current card to start' do
    expect(@test_round.current_card).to be_instance_of(Card)
  end

  it 'has a deck of cards' do
    expect(@test_round.deck).to be_instance_of(Deck)
  end

  it 'starts with no turns' do
    expect(@test_round.turns).to match_array([])
  end

  it 'returns an instance of a Turn after taking a turn' do
    test_turn = @test_round.take_turn("Juneau")
    expect(test_turn).to be_instance_of(Turn)
  end

  it 'taking a turn returns an instance of a Turn and records it to turns' do
    test_turn = @test_round.take_turn("Juneau")

    expect(@test_round.turns.length).to eq(1)
  end

  it 'tracks number of correct guesses' do
    @test_round.take_turn("Juneau")
    @test_round.take_turn("Sep 2, 1946")
    expect(@test_round.number_correct).to eq(1)
  end

  it 'calculates percent correct' do
    @test_round.take_turn("Denver")
    @test_round.take_turn("Sep 2, 1945")
    @test_round.take_turn("5")
    @test_round.take_turn("144")
    expect(@test_round.percent_correct).to eq(75.0)
  end

  it 'returns number of correct guesses by category' do
    @test_round.take_turn("Denver")
    @test_round.take_turn("Sep 2, 1945")
    @test_round.take_turn("5")
    @test_round.take_turn("144")
    expect(@test_round.number_correct_by_category(:Math)).to eq(2)
    expect(@test_round.number_correct_by_category(:Geography)).to eq(0)
    expect(@test_round.number_correct_by_category(:History)).to eq(1)
  end

  it 'returns percent correct by category' do
    @test_round.take_turn("Denver")
    @test_round.take_turn("Sep 2, 1945")
    @test_round.take_turn("5")
    @test_round.take_turn("122")
    expect(@test_round.percent_correct_by_category(:Math)).to eq(50.0)
    expect(@test_round.percent_correct_by_category(:Geography)).to eq(0)
    expect(@test_round.percent_correct_by_category(:History)).to eq(100)
  end

end
