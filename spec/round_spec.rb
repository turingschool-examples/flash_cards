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
  end

  it 'has a current card to start' do
  end

  it 'has a deck' do
  end

  it 'starts with no turns' do
  end

  it 'taking a turn returns an instance of a Turn and records it to turns' do
  end

  it 'tracks number of correct guesses' do

  end

  it 'returns number of correct guesses by category' do

  end

  it 'returns percent correct by category' do
  end

end
