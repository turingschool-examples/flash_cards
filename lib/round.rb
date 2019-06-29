class Round
  attr_accessor :deck, :number_correct, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @index = 0
    @number_correct = 0
  end

  def current_card
    @deck.cards[@index]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    if turn.correct?
      @number_correct += 1
    end
    @index += 1
    turn
  end

  def number_correct_by_category(category)
    array = @turns.select {|turn| turn.card.category == category && turn.correct?}
    array.count
  end

  def percent_correct
    if @turns.empty?
      return 0
    end
    (@number_correct.to_f / @turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    array_correct = @turns.select {|turn| turn.card.category == category && turn.correct?}
    array_total = @turns.select {|turn| turn.card.category == category}
    if array_total.empty?
      return 0
    end
    (array_correct.count.to_f / array_total.count.to_f) * 100
  end

end
