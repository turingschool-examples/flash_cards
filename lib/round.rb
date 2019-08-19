class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def take_turn(guess)
    @turns << Turn.new(guess, @deck.cards.shift)
  end

  def current_card
    @turns.last.card
  end

  def number_correct
    counter = 0
    turns.each do |turn|
      if turn.correct? == true
         counter += 1
      end
    end
    return counter
  end

  def number_correct_by_category(category)
    category_correct = 0
    turns.each do |turn|
      if turn.correct? == true && turn.card.category == category
        category_correct += 1
      end
    end
    return category_correct
  end

  def percent_correct
    number_correct.to_f / turns.count.to_f
  end

end
