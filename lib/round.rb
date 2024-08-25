class Round
  attr_reader :deck,
              :turns
              

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    card = current_card
    turn = Turn.new(guess, card)
    @turns << turn
    @deck.cards.shift   
    turn
  end

  def number_correct
    correct_turn = @turns.select do |turn|
      turn.correct?
    end
    correct_turn.count
  end

  def number_correct_by_category(category)
    correct_in_category = @turns.select do |turn|
      turn.correct? && turn.card.category == category
    end
    correct_in_category.count
  end

  def percent_correct
    total_turns = @turns.count
    return 0.0 if total_turns.zero?
    correct_turns = @turns.select do |turn|
      turn.correct?
    end  
    percentage = (correct_turns.count.to_f / total_turns) *100

    percentage.round(2)
  end
  
  def percent_correct_by_category(category)
    category_turns = @turns.select do |turn|
      turn.card.category == category
    end

    total_turns_per_category = category_turns.count
    return 0.0 if total_turns_per_category.zero?

    correct_turns_per_category = category_turns.select do |turn|
      turn.correct?
    end
    
    percentage = (correct_turns_per_category.count.to_f / total_turns_per_category) * 100
    percentage.round(2)
  
    
  end
end
