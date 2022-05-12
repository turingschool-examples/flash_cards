class Round

  attr_reader :deck,
              :turns,
              :correct_turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    if guess == current_card.answer
      @correct_turns << new_turn
    end
    @deck.cards.rotate!
    return new_turn
  end

  def number_correct
    @correct_turns.count
  end

  def number_correct_by_category(category)
    correct = @correct_turns.select do |turn|
      category == turn.card.category
    end
    correct.length
  end

  def percent_correct
    (@correct_turns.length.to_f / @turns.length.to_f) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / @deck.cards_in_category(category).length.to_f) * 100
  end

end
