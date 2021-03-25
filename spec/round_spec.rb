require_relative '../lib/card'
require_relative '../lib/deck'
require_relative '../lib/turn'
require_relative '../lib/round'

RSpec.describe Round do

  before :each do
    card1 = Card.new('Given x = 13 and y = 2, what is the result of x to the power of y?',
    '169', :Math)
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

  it 'initializes an empty array' do
    expect(@round.turns).to be_instance_of(Array)
  end

  it 'can select single card from a deck' do
    expect(@round.current_card).to be_instance_of(Card)
  end

  # This section was really confusing delving into the Turn class
  describe 'turns' do

    it 'can take a turn' do
      user_guess = "Michael Franti"

      turn_in_round = @round.take_turn(user_guess)
      expect(turn_in_round).to be_instance_of(Turn)
    end

    it 'can detect incorrect guess' do
      incorrect_user_guess = "Michael Franti"
      incorrect_round = @round.take_turn(incorrect_user_guess)

      expect(incorrect_round.correct?).to eq(false)
    end


    it 'adds a turn to empty array' do
      @round.take_turn('lols')
      expect(@round.turns).to_not be_empty
    end

    it 'increments card index' do
      @round.take_turn('why even?')
      @round.take_turn('42')
      @round.take_turn('G-Eazy')
      expect(@round.card_index).to eq(3)
    end

    it 'adds correct cards to array' do
      @round.take_turn('169')
      expect(@round.correct_card_array).to_not be_empty
    end

    it 'counts correct cards' do
      @round.take_turn('169')
      expect(@round.number_correct).to eq(1)
    end

    it 'counts correct cards by category' do
      @round.take_turn('169')
      expect(@round.number_correct_by_category(:Math)).to eq(1)
    end

    it 'does not count correct cards when outside category' do
      @round.take_turn('169')
      expect(@round.number_correct_by_category(:Civics)).to eq(0)
    end

    # Keep in mind there are 3 cards total in the instance above
    it 'can calculate percentage correct' do
      @round.take_turn('169')
      @round.take_turn('idk yo')
      @round.take_turn('so sorryy')
      expect(@round.percent_correct).to eq(33.3)
    end

    # Keep in mind there are 3 cards total in the instance above
    it 'can calculate percentage by category' do
      @round.take_turn('169')
      @round.take_turn('idk yo')
      @round.take_turn('so sorryy')
      expect(@round.percent_correct_by_category(:Math)).to eq(100.0)
    end

  end

end
