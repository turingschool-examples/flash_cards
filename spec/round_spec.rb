require './lib/helper.rb'

RSpec.describe Round do
  let!(:card1) {Card.new("What is the capital of Alaska?", "Juneau", :Geography)}
  let!(:card2) {Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)}
  let!(:card3) {Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)}
  let!(:cards) {[card1, card2, card3]}
  let!(:deck) {Deck.new(cards)}
  let!(:round) {Round.new(deck)}

  xit 'is an instance of' do
    expect(round).to be_instance_of(Round)
  end

  xit 'has a deck' do
    expect(round.deck.cards.count).to eq(3)
  end

  xit 'can return cards from a category' do
    expect(round.deck.cards_in_category(:STEM)).to eq([card2, card3])
  end

  xit 'can check the current card' do
    expect(round.current_card).to_not eq(deck.cards.last)
  end

  xit 'can take a turn' do
    expect(round.check_guess).to eq(round.correct_guess)
  end

  xit 'can check a guess that has been made' do
    expect(round.check_guess).to eq(round.correct_guess)
    round.take_turn('Anchorage')
    expect(round.check_guess).to eq(round.incorrect_guess)
  end

  xit 'can give feedback based on guess' do
    expect(round.correct_guess).to eq('Correct!')
    expect(round.number_correct).to eq(1.0)
    round.take_turn('Anchorage')
    expect(round.incorrect_guess).to eq('Incorrect.')
    expect(round.number_correct).to eq(1.0)
  end

  xit 'can tell the number of correct answers in a specific category' do
    expect(round.number_correct_by_category(:Geography)).to eq(1)
  end

  xit 'can tell the percentage of correct answers' do
    expect(round.percent_correct).to eq(100)
  end

  xit 'can tell the percentage of correct answers in a category' do
    expect(round.percent_correct_by_category(:Geography)).to eq(100)
  end

end
