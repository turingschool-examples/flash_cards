class Round
 attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def count
    return @cards.length
  end

  # def current_card
  #   return
  # end

  # def take_turn(guess)
  #   turn = Turn.new(guess, card)
  #   return turn
  # end

  # def number_correct(card.guess)
  #   x = 0
  #   if card.guess == card.answer
  #     x = x + 1
  #   end
  #   return x
  # end

  # def class
  # end

  # def number_correct_by_category
  # end

  # def percent_correct
  # end
end
