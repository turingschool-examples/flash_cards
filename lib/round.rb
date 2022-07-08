class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @right_answers = []
  end

  def current_card
    @deck.cards[turns.count]
  end

  def take_turn(guess)
    @new_turn = Turn.new(guess, current_card)
    @turns << @new_turn

    if @new_turn.correct?
      @number_correct += 1
      @right_answers << current_card
    end

    @new_turn
  end

  def number_correct_by_category(category)
    @right_answers.map { |card| card.category }.count
  end

  def percent_correct
    (@number_correct.to_f) / (@turns.count.to_f) * 100
  end
end
