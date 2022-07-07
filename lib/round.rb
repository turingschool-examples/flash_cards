class Round

  attr_reader :turns,
              :deck,
              :number_correct

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
    turns << turn

    if turn.correct?
      @number_correct += 1
    end

    deck.cards.rotate!
    turn
  end

  def number_correct_by_category(category)
    correct_by_category = 0
    turns.each do |turn|
      if turn.card.category == category
        if turn.correct?
          correct_by_category += 1
        end
      end
    end
    correct_by_category
  end

  def percent_correct
    (@number_correct / turns.length.to_f) * 100.0
  end

  def percent_correct_by_category(category)
    number_in_category = 0
    turns.each do |turn|
      if turn.card.category == category
        number_in_category += 1
      end
    end
    (number_correct_by_category(category).to_f / number_in_category.to_f) * 100.0
  end
  
end
