class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_guesses = []

  end

  def current_card
    @deck.cards[@turns.length]

  end

  def take_turn(guess)
  new_turn = Turn.new(guess, current_card)
  @turns << new_turn
  @turns.last
  end

  def number_correct

    @turns.find_all do |turn|
    if turn.correct?
      @correct_guesses << turn
     end
    end
    @correct_guesses.count
 end
 

end
