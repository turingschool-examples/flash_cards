require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


RSpec.describe Round do
  before do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(cards)
    @round = Round.new(@deck)
  end

  describe '#initialize' do
    it 'is initialized as an instance of Round' do
      expect(@round).to be_instance_of(Round)
    end

    it 'contains a deck by default' do
      expect(@round.deck).to eql(@deck)
    end

    it 'has no turns by default' do
      expect(@round.turns).to eql([])
    end

    it 'has no attempts by default' do
      expect(@round.attempt).to eql(nil)
    end

    it 'has no number correct by default' do
      expect(@round.number_correct).to eql(0)
    end
  end

  describe '#current card' do
    it 'displays the current card' do
      expect(@round.current_card).to eql(@card_1)
      expect(@round.current_card.class).to eql(Card)
    end
  end

  describe '#attempts_correct_answer' do
    it 'attempts to answer correctly' do
      expect(@round.attempts_correct_answer('Juneau')).to be_instance_of(Turn)
    end
  end

  describe '#store_guess_as_turn' do
    it 'stores a guess as a turn' do
      @round.attempts_correct_answer('Juneau')
      expect(@round.store_guess_as_turn).to eql(@round.turns)
    end
  end

  describe '#new_card_added_to_top_of_deck' do
    it 'adds a new card to the top of the deck' do
      @round.attempts_correct_answer('Juneau')
      @round.store_guess_as_turn
      @round.new_card_added_to_top_of_deck
      expect(@deck.cards[0]).to eql(@card_2)
      expect(@deck.cards[2]).to eql(@card_1)
    end
  end

  describe '#take_turn' do
    it 'accepts a correct answer' do
      @round.take_turn('Juneau')
      expect(@round.number_correct).to eql(1)
      expect(@round.turns.last.feedback?).to eql('Correct')
      expect(@round.turns.count).to eql(1)
      expect(@round.current_card).to eql(@card_2)
    end

    it 'accepts a case insensitive answer correctly' do
      @round.take_turn('juneau')
      expect(@round.number_correct).to eql(1)
      expect(@round.turns.last.feedback?).to eql('Correct')
      expect(@round.turns.count).to eql(1)
      expect(@round.current_card).to eql(@card_2)
    end

    it 'does not increment number correct if it receives an incorrect answer' do
      @round.take_turn('Anchorage')
      expect(@round.number_correct).to eql(0)
      expect(@round.turns.last.feedback?).to eql('Incorrect')
      expect(@round.turns.count).to eql(1)
      expect(@round.current_card).to eql(@card_2)
    end

    it 'takes two correct guesses' do
      @round.take_turn("Juneau")
      expect(@round.number_correct).to eql(1)
      expect(@round.turns.last.feedback?).to eql('Correct')
      expect(@round.turns.count).to eql(1)
      expect(@round.current_card).to eql(@card_2)
      @round.take_turn("Mars")
      expect(@round.number_correct).to eql(2)
      expect(@round.turns.last.feedback?).to eql('Correct')
      expect(@round.turns.count).to eql(2)
      expect(@round.current_card).to eql(@card_3)
    end
  end

  describe '#number_correct_by_category' do
    it 'calculates percentage correct by category' do
      @round.take_turn("Juneau")
      @round.take_turn("Saturn")
      @round.take_turn("Compadre")
      expect(@round.number_correct_by_category(:Geography)).to eql(100.0)
    end
  end

  describe '#percent_correct' do
    it 'calculates total percentage correct' do
      @round.take_turn("Juneau")
      @round.take_turn("Saturn")
      @round.take_turn("Compadre")
      expect(@round.percent_correct).to eql(33.0)
    end
  end

end
