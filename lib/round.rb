class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
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

  def current_card
    return deck.cards[turns.count]
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

  end
end
