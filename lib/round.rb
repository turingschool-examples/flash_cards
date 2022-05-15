class Round

attr_reader :turns, :deck, :turn, :number_correct, :take_turn, :cards, :number_correct_by_category

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0

  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
      @turns << turn
      if turn.correct?
        @number_correct += 1
      end
      deck.cards.rotate!
    return turn
  end

  def number_correct_by_category(category)
    number_correct_by_category = 0
    @turns.each do |turn|
        if turn.card.category == category && turn.correct?
          number_correct_by_category += 1
          end
          return number_correct_by_category
        end
      end

  def percent_correct
    return @number_correct.fdiv(@turns.count) * 100
  end

  def total_turns_in_categories(category)
      total_turns = 0
      @turns.each do |turn|
          if turn.card.category == category
              total_turns += 1
          end
      end
      return total_turns
  end

  def percent_correct_by_category(category)
    return number_correct_by_category(category).fdiv(total_turns_in_categories(category)) * 100
  end

end
