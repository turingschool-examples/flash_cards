class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = 0
  end

  def current_card
    @deck.cards[@current_card]
  end

  def take_turn(guess)
    record_turn = Turn.new(guess, current_card)
    @turns << record_turn
    record_turn
    @current_card += 1
  end

  def number_correct
    num_correct = 0
    @turns.each do |turn|
      if turn.correct?
        num_correct += 1
      end
    end
    num_correct
  end

  def number_correct_by_category(category)
    @turns.count{|turn| turn.card.category == category && turn.correct?}
  end

  def percent_correct
    ((number_correct / @turns.count.to_f) * 100).round
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category) / @turns.count {|turn|
    turn.card.category == category}.to_f * 100).round
  end
end
