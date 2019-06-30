class Round
  attr_reader :the_deck, :turns, :number_correct, :number_correct_by_category, :percent_correct, :percent_correct_by_category

  def initialize(the_deck)
    @the_deck = the_deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    num = @turns.count
    @the_deck.cards[num]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @number_correct += 1 if new_turn.correct?
    return new_turn
  end

  def number_correct_by_category(category)
    @turns.find_all do |turn|
      turn.card.category == category && turn.correct?
    end.count
  end

  def percent_correct
    return ((@number_correct.to_f / @turns.count.to_f).to_f) * 100
  end

  def percent_correct_by_category(category)
    return ((number_correct_by_category(category).to_f / @the_deck.cards_in_category(category).count)) * 100
  end
end
