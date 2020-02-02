class Round

  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0

  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
      new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        @deck.cards.rotate!
      if new_turn.correct?
        @number_correct += 1
      end
    return new_turn
  end


  def number_correct_by_category(category)
    number_of_correct_by_category = 0
    @turns.each do |turn|
      if turn.correct? == true && turn.card.category == category
        number_of_correct_by_category += 1
      end
    end
    number_of_correct_by_category
  end

  def percent_correct
    total_correct = 0.0
    @turns.each do |turn|
      if turn.correct?
        total_correct += 1
      end
    end
    ((total_correct/@turns.length) * 100).to_f
  end

  def percent_correct_by_category(category)
    100 * (self.number_correct_by_category(category).to_f / @deck.cards_in_category(category).length)
  end

end
