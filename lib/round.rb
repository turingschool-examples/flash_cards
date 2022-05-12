class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    return deck.cards[turns.count]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    return turn
  end

  def number_correct
    number_correct = 0
    @turns.each do |turn|
      if turn.guess == turn.card.answer
        number_correct += 1
      end
    end
    return number_correct
  end

  def percent_correct
    number_correct = 0

    @turns.each do |turn|
      if turn.guess == turn.card.answer
        number_correct += 1
      end
    end
    percent_correct = (number_correct.to_f / @turns.count.to_f) * 100
    return percent_correct
  end

  def number_correct_by_category(category)
    # Needs to compare number_correct to count of turns
    number_correct = 0
    @turns.each do |turn|
      if category == turn.card.category
          if turn.guess == turn.card.answer
            number_correct += 1
          end
        end
    end
    return number_correct
  end

  def percent_correct_by_category(category)
    # Needs to compare number_correct to count of turns then return as a percentage
    number_correct = 0
    @turns.each do |turn|
      if category == turn.card.category
          if turn.guess == turn.card.answer
            number_correct += 1
          end
        end
    end
    number_in_category = deck.cards_in_category(category).count
    percent_correct = (number_correct/number_in_category).to_f * 100
    return percent_correct
  end
end
