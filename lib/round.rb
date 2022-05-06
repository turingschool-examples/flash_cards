class Round

  attr_reader :deck, :turns, :correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @correct = 0
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    if guess == current_card.answer
      @correct += 1
    end
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    deck.cards.delete_at(0)
  end

  def number_correct
    @correct
  end

  def number_correct_by_category(category)
    correct_count = 0
    @turns.each do |turn|
      if turn.card.answer == turn.guess && turn.card.category == category
        correct_count += 1
      end
    end
    correct_count
  end

  def percent_correct
    (number_correct.to_f / @turns.length * 100)
  end

  def percent_correct_by_category(category)
    category_total = turns.select do |turn|
      turn.card.category == category
    end.length
    (number_correct_by_category(category).to_f / category_total) * 100
  end
end
