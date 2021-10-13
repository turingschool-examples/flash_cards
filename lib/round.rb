class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck  = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @deck.cards.rotate!
    @turns.last
  end

  def number_correct
    @turns.find_all do |turn|
      turn.card.answer == turn.guess
    end.length
  end

  def number_correct_by_category(category)
    @turns.find_all do |turn|
      turn.guess == turn.card.answer && turn.card.category == category
    end.length
  end

  def percent_correct
    number_correct.to_f / @turns.length.to_f * 100
  end

  def percent_correct_by_category(category)
    category_count = @turns.find_all do |turn|
      turn.card.category == category
    end
    number_correct_by_category(category).to_f / category_count.length.to_f * 100 
  end
end
