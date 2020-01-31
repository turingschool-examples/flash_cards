
class Round
  attr_reader :deck, :turns, :current_card, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @current_card = @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, @current_card)
    @turns << turn
    if turn.correct? == true
      @number_correct += 1
    end
    @deck.cards.shift
    @current_card = @deck.cards.first
    return turn
  end

  def number_correct_by_category(category)
    number_correct_by_category = 0
    @turns.each do |turn|
      if turn.card.category == category && turn.correct? == true
        number_correct_by_category += 1
      end
    end
    return number_correct_by_category
  end

  def percent_correct
    ((@number_correct.to_f) / @turns.length.to_f) * 100.0

  end

  def percent_correct_by_category(category)
    total_number_category = 0
    @turns.each do |turn|
      if turn.card.category == category
        total_number_category += 1
      end
    end
    (number_correct_by_category(category).to_f / total_number_category) * 100.0

  end

end
