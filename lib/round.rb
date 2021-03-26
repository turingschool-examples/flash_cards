class Round
  attr_reader  :deck,
                    :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.find do |card|
      card
    end
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift #may need to change this back to rotate!
    new_turn
  end

  def number_correct #want to refactor this
    amount_correct = []
    @turns.each do |turn|
      if turn.guess == turn.card.answer
        amount_correct << turn.card
      end
    end
    amount_correct.length
  end
    # @turns.find_all do |turn|
    #   if turn.card.answer == turn.guess
    #     @amount_correct += 1
    #   end
    # end

  def number_correct_by_category(category)
    @turns.find_all do |turn|
      turn.card.category == category && turn.card.answer == turn.guess #want to refactor this
    end.length
  end

  def percent_correct
    (number_correct.to_f / @turns.length) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / correct_category(category)) * 100
  end

  def correct_category(category) #refactor
    cat = []
    @turns.each do |turn|
      if turn.card.category == category
        cat << turn.card
      end
    end
    cat.length
  end
end
