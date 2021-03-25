class Round
  attr_reader  :deck,
                    :turns,
                    :amount_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @amount_correct = 0
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.rotate!
    new_turn
  end

  def number_correct
    @turns.map do |turn|
      if turn.card.answer == turn.guess
        @amount_correct += 1
      end
    end
    amount_correct
  end

  # def number_correct_by_category(category)
  #   # find correct turns
  #   # match to category to category
  #   # return an integer
  # end
end
