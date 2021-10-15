class Round
  attr_reader :deck, :turns, :number_correct, :number_correct_by_category



  def initialize (deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @number_correct_by_category = 0
  end

  def current_card
    deck.cards.first

  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    deck.cards.shift
    @number_correct += 1 if turn.correct?
    turn
  end

  def number_correct_by_category(category)
    turns.select do |turn|
      turn.card.answer == turn.guess && turn.card.category == category
    end.count
  end

  def percent_correct
    (@number_correct.to_f / (turns.count) * 100).round  #* 100.to_i
  end

  def percent_correct_by_category(category)
    percent = turns.select do |turn|
      turn.card.answer == turn.guess && turn.card.category == category
    end.size
    (percent.to_f / (turns.count) * 100).round
  end




end
