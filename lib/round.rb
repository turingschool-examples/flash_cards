class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

def current_card
  @deck.cards[0]
end

def take_turn(guess)
  new_turn = Turn.new(guess, current_card)
  @turns << new_turn
  @deck.cards.rotate! #rotate without bang wasn't moving it
  return new_turn
end


def correct_turns
  @turns.find_all {|turn| turn.correct?}
end

def number_correct
  correct_turns.count
end


def number_correct_by_category(category)
  correct_turns.find_all {|turn| turn.card.category == category}.count
end

def percent_correct
  number_correct.fdiv(@turns.length) * 100
end

def percent_correct_by_category(category)
  number_correct_by_category(category).fdiv(@turns.find_all {|turn| turn.card.category == category}.count) * 100
end

def cards_remaining?
  return true if @turns.count + 1 <= deck.cards.count
  false
end


end
