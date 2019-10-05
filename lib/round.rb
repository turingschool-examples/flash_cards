class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.shift
  end

  # revisit this method later and visualize!!!!
  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    new_turn
  end

  def number_correct
    correct = 0
    @turns.each do |turn|
      if turn.correct?
        correct += 1
      end
    end
    correct
  end

  def number_correct_by_category(category)
    cat_correct = @turns.find_all do |turn|
      turn.card.category == category && turn.correct?
    end
    cat_correct.count
  end

  def percent_correct
    # to get total percent correct you want to take number of correct answers by total number of cards in turn.
    number_correct.to_f / @turns.count * 100
  end

  def percent_correct_by_category(category)
    # to get percent correct by category, you want to isolate correct guesses in a category and divide that number by the number of cards that match that category in the turn
    turn_cat = @turns.find_all do |turn|
      turn.card.category == category
    end
    number_correct_by_category(category).to_f / turn_cat.count * 100
  end
end
