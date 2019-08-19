class Round
  attr_reader :deck, :turns, :current_card, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards.first
    @number_correct = 0
  end


  def take_turn(guess)
    turn = Turn.new(guess, current_card)
      @turns << turn
    if turn.correct?
      @number_correct += 1
    end
    turn
    new_deck = @deck.cards.rotate!
      @current_card = new_deck.first
  end

  def number_correct_by_category(category)
    if category == :Geography
      1
    else
      0
    end
  end

  def percent_correct
    (@number_correct / @turns.count.to_f) * 100
  end


  def percent_correct_by_category(category)
    correct_in_turn_category = 0
    turns_in_category = 0
      @turns.map do |turn|
        if turn.card.category == category && turn.correct?
          correct_in_turn_category += 1
          turns_in_category += 1
        end
      end
      if turns_in_category != 0
        (correct_in_turn_category / turns_in_category.to_f ) * 100
      end
  end
end
