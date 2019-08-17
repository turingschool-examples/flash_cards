
class Round
  attr_accessor :deck, :current_card, :turns, :correct_turns

  def initialize(deck)
    @deck = deck
    @current_card = deck.cards[0]
    @turns = []
    @correct_turns = []
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift
    @current_card = deck.cards[0]
    new_turn
  end

  def number_correct
    @turns.find_all do |turn|
      if turn.correct? == true
        @correct_turns << turn
      end
    end
    @correct_turns.count
  end

end
