require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/game'

describe Game do
  before(:each) do
    #initialize deck
    @card_1 = Card.new("What is 5 + 5?", "10", :STEM)
    @card_2 = Card.new("What is Rachel's favorite animal?", "Lion", :Turing_staff)
    @card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_staff)
    @card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_culture)
    @deck = Deck.new([@card_1, @card_2, @card_3, @card_4])
    @round = Round.new(@deck)
    @game = Game.new(@deck)
  end

  it 'exists' do
    expect(@game).to be_instance_of(Game)
  end

  it 'has deck' do
    expect(@game.deck).to eq(@deck)
  end

  it 'has deck length' do
    expect(@game.og_deck_length).to eq(4)
  end

  it 'has round' do
    expect(@game.round).to be_instance_of(Round)
  end
end
