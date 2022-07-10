require './lib/round'

RSpec.describe Round do
  before(:each) do
    @card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    @card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                       'North north west', :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  it 'exists' do
    expect(@round).to be_instance_of(Round)
  end

  it 'starts with no turns taken' do
    expect(@round.turns).to eq([])
  end

  it 'has a current card' do
    expect(@round.current_card).to eq(@card_1)
  end

  it 'takes turns' do
    new_turn = @round.take_turn('Juneau')
    expect(new_turn).to be_instance_of(Turn)
  end

  it 'counts correct guesses' do
    new_turn = @round.take_turn('Juneau')
    expect(@round.number_correct).to eq(1)
  end

  it 'moves on to the next card after a turn' do
    new_turn = @round.take_turn('Juneau')
    expect(@round.current_card).to eq(@card_2)
  end

  it 'recognizes an incorrect answer' do
    new_turn = @round.take_turn('Juneau')
    new_turn = @round.take_turn('Venus')
    expect(@round.number_correct).to eq(1)
  end

  it 'keeps track of turns' do
    new_turn = @round.take_turn('Juneau')
    new_turn = @round.take_turn('Venus')
    expect(@round.turns.count).to eq(2)
  end

  it 'provides feedback on the most recent turn' do
    new_turn = @round.take_turn('Juneau')
    new_turn = @round.take_turn('Venus')
    expect(@round.turns.last.feedback).to eq('Incorrect.')
  end

  it 'counts correct answers by category' do
    new_turn = @round.take_turn('Juneau')
    new_turn = @round.take_turn('Venus')
    expect(@round.number_correct_by_category(:STEM)).to eq(0)
    expect(@round.number_correct_by_category(:Geography)).to eq(1)
  end

  it 'returns percentage of correct answers' do
    new_turn = @round.take_turn('Juneau')
    new_turn = @round.take_turn('Venus')
    expect(@round.percent_correct).to eq(50.0)
    expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
  end

  it 'collects categories' do
    @round.collect_category
    expect(@round.categories).to eq(%i[Geography STEM])
  end
end
