class Round
  attr_reader :deck, :turns, :correct_counter, :current_card

  def initialize (deck)
    @deck = deck
    @turns = []
    @correct_counter = 0
    @current_card = 0
  end

  def current_card
    deck.cards[@current_card]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    next_card
    new_turn
  end

  def next_card
    @current_card += 1
  end

  def number_correct
    @turns.find_all do |turn|
      return @correct_counter + 1 if turn.correct?
    end
  end
end
