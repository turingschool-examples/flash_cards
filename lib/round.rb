class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def take_turn(guess)

  end

  def number_correct
    # Needs to iterate through turns
    #
    # number_correct = 0
    # round.turns.each do |turn|
    #   If guess == answer
    #     number_correct += 1
    #   end
    # end
    #
    # return number_correct

  end

  def current_card
    return deck.cards[turns.count]
  end

  def number_correct_by_category(category)
    # Needs to compare number_correct to count of turns

  end

  def percent_correct_by_category(category)
    # Needs to compare number_correct to count of turns then return as a percentage

  end
end
