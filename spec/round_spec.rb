# typed: ignore

require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do # rubocop:disable Metrics/BlockLength
  before(:each) do
    @card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    @card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  it 'has a deck method to see the deck' do
    expect(@round.deck).to be_an_instance_of(Deck)
  end

  it 'has an array of turns' do
    expect(@round.turns).to eq([])
  end

  it 'has a current card on each turn, starting with the first card' do
    expect(@round.current_card).to eq(card1)
  end

  it 'adds a new Turn object when take_turn is called' do
    new_turn = @round.take_turn('Juneau')
    expect(new_turn).to be_an_instance_of(Turn)
  end

  it 'shows whether the answer is correct' do
    new_turn = @round.take_turn('Juneau')
    expect(new_turn.correct?).to eq(true)
  end

  it 'shows whether the answer is incorrect' do
    new_turn = @round.take_turn('Topeka')
    expect(new_turn.correct?).to eq(false)
  end

  it 'appends each turn to the round.turns array' do
    @round.take_turn('Juneau')
    @round.take_turn('Mars')
    expect(@round.turns.count).to eq(2)
  end

  it 'displays the number of correct answers' do
    @round.take_turn('Juneau')
    @round.take_turn('Mars')
    expect(@round.number_correct).to eq(2)
  end

  it 'gives feedback on the last answer' do
    @round.take_turn('Juneau')
    @round.take_turn('Mars')
    expect(@round.turns.last.feedback).to eq('Incorrect.')
  end

  it 'doesn\'t count every answer as correct' do
    @round.take_turn('Juneau')
    @round.take_turn('Mars')
    @round.take_turn('East')
    expect(@round.number_correct).to eq(2)
  end

  it 'shows number correct for a given category' do
    @round.take_turn('Juneau')
    @round.take_turn('Mars')
    @round.take_turn('East')
    expect(@round.number_correct_by_category(:STEM)).to eq(1)
  end

  it 'shows percent correct for a given category' do
    @round.take_turn('Juneau')
    @round.take_turn('Mars')
    @round.take_turn('East')
    expect(@round.percent_correct_by_category(:STEM)).to eq(50.0)
  end

  it 'shows the current turn card' do
    @round.take_turn('Juneau')
    @round.take_turn('Mars')
    expect(@round.current_card).to eq(card3)
  end
end
