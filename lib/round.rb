class Round
  attr_reader :deck, :turns, :current_card, :correct_turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_turns = []
    @current_card = deck.cards[0]
  end

  def current_card
    deck.cards.shift
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    turns << new_turn
    deck.cards.shift
    new_turn
  end

  def class
  end

  def correct?
    guess == new_card.answer
  end

  def number_correct
    turns.find_all do |turn|
      if turn.correct?
        correct_turns << turns
      end
      correct_turns.count
    end
  end

  def count
    @round.turns.count
  end

end
