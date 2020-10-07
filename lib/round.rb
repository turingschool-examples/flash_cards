class Round
  attr_reader :deck,
              :turns,
              :number_correct,
              :number_incorrect

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @number_incorrect = 0
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    if turn.correct?
      add_number_correct
    else add_number_incorrect
    end
    @deck.cards.rotate!
    return turn
  end

  def add_number_correct
    @number_correct += 1
  end

  def add_number_incorrect
    @number_incorrect += 1
  end

  def number_correct_by_category(category)
    correct_by_category = turns_by_category(category).count do |turn|
                          turn.guess == turn.card.answer
                          end
  end

  def turns_by_category(category)
    turns_by_category = @turns.select do |turn|
                        turn.card.category == category
                        end
  end

  def percent_correct
    (@number_correct.to_f / @turns.length.to_f) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / turns_by_category(category).length.to_f) * 100
  end

end
