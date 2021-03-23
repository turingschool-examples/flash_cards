require_relative '../lib/card'
require_relative '../lib/deck'
require_relative '../lib/turn'
require_relative '../lib/round'

RSpec.describe Round do

  before :each do
    card1 = Card.new('Given x = 13 and y = 2, what is the result of x to the power of y?',
    169, :Math)
    card2 = Card.new('What is the capital of US state of Indiana?', 'Indianapolis', :Geography)
    card3 = Card.new('Fill in the blank: In the US, the ___ of Rights is a section of the Constitution that guarantees the rights and liberties for an individual.',
    "Bill", :Civics)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    @round = Round.new(deck)
  end

  it 'exists' do
    expect(@round).to be_instance_of(Round)
  end

  it 'can access a deck' do
    expect(@round.deck).to be_instance_of(Deck)
  end

  it 'initializes an array' do
    expect(@round.turns).to be_instance_of(Array)
  end

end
