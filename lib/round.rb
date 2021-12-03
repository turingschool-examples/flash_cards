class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    if guess == current_card.answer
      @correct_turns << new_turn
    end
    # binding.pry
    @deck.cards.rotate!
    return new_turn
  end

  def number_correct
    @correct_turns.length
  end
end
