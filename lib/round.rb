class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def start
    start_message = "Welcome! You're playing with #{deck.cards.count} cards."
    puts start_message
    puts "-------------------------------------------------"
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
      if turn.correct?
        number_correct += 1
      end
    end
    return number_correct
  end

  def percent_correct
    number_correct = 0

    @turns.each do |turn|
      if turn.correct?
        number_correct += 1
      end
    end

    percent_correct = (number_correct.to_f / @turns.count.to_f) * 100
    return percent_correct
  end

  def number_correct_by_category(category)
    number_correct = 0
    @turns.each do |turn|
      if category == turn.card.category
          if turn.correct?
            number_correct += 1
          end
        end
    end
    return number_correct
  end

  def percent_correct_by_category(category)
    number_correct = 0
    @turns.each do |turn|
      if category == turn.card.category
          if turn.correct?
            number_correct += 1
          end
        end
    end
    number_in_category = deck.cards_in_category(category).count
    percent_correct = (number_correct.to_f / number_in_category.to_f) * 100
    return percent_correct
  end
end
