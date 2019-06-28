class Round
  attr_reader :deck, :turns #deck.cards = array

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck[@turns.count]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.rotate
    new_turn
  end

  def number_correct
    number_correct = 0
    @turns.each do |turn|
      if turn.correct?
        number_correct += 1
      end
    end
    return number_correct
  end

  def number_correct_category(category)
    number_correct_category = 0
    @turns.each do |turn|
      if turn.correct? && turn.card.category == category
       number_correct_category += 1
      end
    end
    return number_correct_category
  end

  def percent_correct
    (number_correct.to_f  / @turns.count) * 100
  end

  def percent_correct_category(category)
    number_correct_category(category) / @turns.count {|turn|
      turn.card.category == category}.to_f * 100
  end


end
