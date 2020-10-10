class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[turns.count]
  end

  def take_turn(guess)
  new_turn = Turn.new(guess, current_card)
  @turns << new_turn
  new_turn
  end

  def number_correct
    correct_guesses = []

    @turns.find_all do |turn|
    if turn.correct?
      correct_guesses << turn
    end
   end
  correct_guesses.count
 end

end
