class Round
  attr_reader :deck,
              :turns,
              :current_card,
              :number_correct,
              :number_wrong,
              :number_correct_by_category

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards[0]
    @number_correct = 0
    @number_wrong = 0
    @number_number_correct_by_category = 0
  end

  def take_turn(guess)
    x = Turn.new(guess, current_card)
    x.correct? ? @number_correct += 1 : @number_wrong += 1
    @turns << x
    @current_card = deck.cards[+1]
    @turns.last
  end

  def percent_correct
    (number_correct / turns.size.to_f) * 100
  end

  def number_correct_by_category(category)
    turns_correct_by_category = turns.count do |turn|
      category == turn.card.category && turn.guess == turn.card.answer
    end
  end

  def percent_correct_by_category(category)
    turns_correct_by_category = turns.count do |turn|
      category == turn.card.category && turn.guess == turn.card.answer
    end
    total_turns_by_category = turns.count do |turn|
      category == turn.card.category
    end
    (turns_correct_by_category / total_turns_by_category.to_f) * 100
  end
end
