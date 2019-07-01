class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []

  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.rotate!
    turn
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category)
    answers = @turns.select {|turn| turn.card.category == category}
    answers.count do |answer|
      answer.correct?
    end
  end

  def percent_correct
    number_correct.to_f * 100 / @turns.count
  end

  def percent_correct_by_category(category)
    number_correct_by_category(category).to_f * 100 / 
    @turns.count {|turn| turn.card.category == category}
  end


end
