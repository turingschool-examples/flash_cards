class Round
  attr_reader :deck,
              :turns,
              :number_correct,
              :number_wrong,
              :current_card,
              :count 

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards[0]
    @number_correct = 0
    @number_wrong = 0
    @count = 0
  end

  def current_card
    @current_card = deck.cards[@count]
  end

  def take_turn(guess)
    x = Turn.new(guess, current_card)
    x.correct? ? @number_correct += 1 : @number_wrong += 1
    @count += 1
    @turns << x
    @turns.last
  end

  def percent_correct
    (number_correct / turns.size.to_f) * 100
  end

  def number_correct_by_category(cat)
    turns_correct_by_category = turns.count do |turn|
      cat == turn.card.category && turn.guess == turn.card.answer
    end
  end

  def percent_correct_by_category(percent_category)
    turns_correct_by_category = turns.count do |turn|
      percent_category == turn.card.category && turn.guess == turn.card.answer
    end
    total_turns_by_category = turns.count do |turn|
      percent_category == turn.card.category
    end
    (turns_correct_by_category.to_f / total_turns_by_category.to_f) * 100
  end
end
