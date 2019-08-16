class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift
    new_turn
  end

  def correct?
    turns.last.correct?
  end

  def number_correct
    correct = []
    @turns.each do |turn|
      if turn.correct?
        correct << turn
      end
    end
    correct.count
  end

  def number_correct_in_category(category)
    @turns.find_all { |turn| turn.correct? && turn.card.category == category}.count
  end

  def percent_correct
    (number_correct.to_f / @turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_in_category(category).to_f / \
    @turns.find_all {|turn| turn.card.category == category}.count.to_f) * 100
  end

  def current_card
    @deck.cards.first
  end
end
