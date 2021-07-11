class Round
  attr_reader :deck, :turns, :take_turn, :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, @deck.cards.shift)
    @turns << turn
      if turn.correct?
        @number_correct += 1
      end
    return turn
  end

  def number_correct_by_category(category)
    # count the number of turns in the round that were correct and whose cards's category is of the desired category
    count = 0
    @turns.each do |t|
      if (t.correct? && t.card.category == category) then
        count += 1
      end
      return count
    end
  end

    def percent_correct
      return (@number_correct / @turns.count.to_f) * 100
    end

    def percent_correct_by_category(category)
      # return the number of correct answers in the category divided by number of turns in that category
      correct = 0
      total = 0
      @turns.each do |t|
        if t.card.category == category
          total += 1
          if t.correct? then
            correct += 1
          end
        end
        return (correct / total.to_f) * 100.0
      end
    end
end
