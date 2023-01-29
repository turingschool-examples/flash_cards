require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  let(:card_1) { Card.new("What is my name?", "Rontron", :People) }
  let(:card_2) { Card.new("Where is the best training track?", "Aurora Reservoir", :Places) }
  let(:card_3) { Card.new("How long is the Miami UltraSkate?", "24 hours", :SkateEvents) }
  let(:card_4) { Card.new("Where does the A2A roadskate begin?", "Athens, GA", :SkateEvents) }
  let(:deck) { Deck.new([card_1, card_2, card_3, card_4]) }

  before(:each) do
    @round = Round.new(deck)
  end

  it 'exists' do
    expect(@round).to be_instance_of(Round)
  end

  it 'holds a deck of cards' do
    expect(@round.deck).to eq(deck)
  end

  it 'can keep track of how many turns have been taken' do
    expect(@round.turns).to eq([])
  end
  
  it 'starts the round with the first card in the deck as the current card' do
    expect(@round.current_card).to eq(card_1)
  end
  
  it 'can take turns' do
    new_turn = @round.take_turn("Rontron")

    expect(new_turn).to be_instance_of(Turn)
    expect(new_turn.correct?).to be true
    expect(@round.turns).to eq([new_turn])
    expect(@round.current_card).to eq(card_2)
  end

  it 'keeps track of how many turns have been taken, and how many have been answered correctly' do
    @round.take_turn("Rontron")
    @round.take_turn("The train Station")

    expect(@round.turns.count).to eq(2)
    expect(@round.turns.last.feedback).to eq("Incorrect! The correct answer was 'Aurora Reservoir'")
    expect(@round.number_correct).to eq(1)
  end

  it 'can tell you the number of correct answers by category' do
    @round.take_turn("Rontron")
    @round.take_turn("The train Station")

    expect(@round.number_correct_by_category(:People)).to eq(1)
    expect(@round.number_correct_by_category(:Places)).to eq(0)
  end

  it 'can tell you the percentage of correct answers' do
    @round.take_turn("Rontron")
    @round.take_turn("The train Station")

    expect(@round.percent_correct).to eq(50.0)
  end

  it 'can tell you the percentage of correct answers by category' do
    @round.take_turn("Rontron")
    @round.take_turn("The train Station")

    expect(@round.percent_correct_by_category(:People)).to eq(100.0)
    expect(@round.percent_correct_by_category(:Places)).to eq(0.0)
  end
end
