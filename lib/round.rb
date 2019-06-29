class Round
  attr_reader :deck, :turns, :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    num = @turns.count
    deck.cards[num]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @number_correct += 1 if new_turn.correct?
    new_turn
  end

  def number_correct_by_category(category)
    correct_in_category = @turns.find_all do |turn|
      category == turn.card.category && turn.correct?
    end
    correct_in_category.count
  end

  def percent_correct
    percent = (@number_correct.to_f / @deck.cards.count * 100).round(2)
    percent.to_s + "%"
  end

  def percent_correct_by_category(category)
    total_in_category = @turns.find_all do |turn|
      category == turn.card.category
    end
    percent = (number_correct_by_category(category).to_f / total_in_category.count * 100).round(2)
    percent.to_s + "%"
  end
end
