class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    @number_correct += 1 if guess == current_card.answer
    @turns << Turn.new(guess, deck.cards.shift)
    @turns.last
  end

  def number_correct_by_category(category)
    @turns.count { |turn| turn if turn.card.category == category && turn.correct? }
  end

  def percent_correct
    ((@number_correct.to_f / @turns.count) * 100).to_i
  end

  def percent_correct_by_category(category)
    ((number_correct_by_category(category).to_f / @turns.count { |turn| turn.card.category == category }) * 100).to_i
  end
end
