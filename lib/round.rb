class Round
  attr_reader :deck, :turns
def initialize(deck)
  @deck = deck
  @turns = []
end

def current_card

  return deck.cards do [@turns.count]
  end
end

def take_turn(guess)
  turns << Turn.new(guess, current_card)
  return @turns.last
end
end

def correct?
  turn.correct?
end


def number_correct
  @turns.total do |count, turn|
    turn.correct? count += 1
  end

  def number_correct_by_category(category)
    count_correct = 0
    cards_in_category = @deck.cards_in_category(category)
    cards_in_category.each do |card|
      if card.turn != nil && card.turn.correct?
        count_correct += 1
      end
    end
    def percent_correct(values = {correc: number_correct, count: @turns.count})
      if values[:correct] != 0
        return (values[:correct] / values[:count].to_f * 100).round(2)
      end
      return 0.0
    end
end
#did not finish 
