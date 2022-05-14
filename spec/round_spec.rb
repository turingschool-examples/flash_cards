require './lib/helper.rb'

RSpec.describe Round do
  let!(:card1) {Card.new("What is the capital of Alaska?", "Juneau", :Geography)}
  let!(:card2) {Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)}
  let!(:card3) {Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)}
  let!(:cards) {[card1, card2, card3]}
  let!(:deck) {Deck.new(cards)}
  let!(:round) {Round.new(deck)}

  it 'is an instance of' do
    expect(round).to be_instance_of(Round)
  end

  it 'has a deck' do
    expect(round.deck.cards.count).to eq(3)
  end

  it 'can return cards from a category' do
    expect(round.deck.cards_in_category(:STEM)).to eq([card2, card3])
  end

  it 'can check the current card' do
    expect(round.current_card).to_not eq(deck.cards.last)
  end

  it 'can take a turn' do
    round.take_turn('Juneau')
    expect(round.turns.last.card).to eq(card1)
  end

  it 'can check a guess that has been made' do
    round.take_turn('Juneau')
    expect(round.check_guess).to eq(true)
    round.take_turn('Anchorage')
    expect(round.check_guess).to eq(false)
  end

  it 'can give feedback based on guess' do
    round.take_turn('Juneau')
    expect(round.turn_feedback).to eq('Correct!')
    round.take_turn('Anchorage')
    expect(round.turn_feedback).to eq('Incorrect.')
  end

  it 'can tell the number of correct and incorrect guesses' do
    round.take_turn('Juneau')
    expect(round.number_correct).to eq(1)
    expect(round.number_incorrect).to eq(0)
    round.take_turn('Anchorage')
    expect(round.number_correct).to eq(1)
    expect(round.number_incorrect).to eq(1)
  end

  it "knows how many cards in a category" do
    expect(round.number_in_category(:STEM)).to eq(2)
  end

  it 'can tell the number of correct answers in a specific category' do
    round.take_turn('Juneau')
    expect(round.number_correct_by_category(:Geography)).to eq(1)
  end

  it 'can tell the percentage of correct answers' do
    round.take_turn('Juneau')
    expect(round.percent_correct).to eq(100)
    round.take_turn('Anchorage')
    expect(round.percent_correct).to eq(50)
  end

  it 'can tell the percentage of correct answers in a category' do
    round.take_turn('Juneau')
    round.card_complete
    expect(round.percent_correct_by_category(:Geography)).to eq(100)
    round.take_turn('Mars')
    round.card_complete
    round.take_turn('East')
    expect(round.percent_correct_by_category(:STEM)).to eq(50)
  end

end
