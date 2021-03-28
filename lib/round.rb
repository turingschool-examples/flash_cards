class Round
  attr_reader :turns,
              :deck
  
  def initialize(deck) 
    @deck   = deck
    @turns  = []
  end
  
  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    next_card
    return turn
  end

  def next_card
    shifted_deck = @deck.cards.rotate
    @deck.cards.replace(shifted_deck)
  end

  def category_scores
    test = @deck.categories.each do |category| 
        puts "#{category} - #{percent_correct_by_category(category)}% correct"
    end
  end

  def number_correct
    correct_turns = @turns.find_all do |turn|
      turn.correct? 
    end

    correct_turns.length 
  end 
  
  def number_correct_by_category(specific_category)
    correct_by_category = @turns.find_all do |turn|
      turn.correct? && turn.card.category == specific_category  
    end

    correct_by_category.length
  end

  def percent_correct
    correct_turns = @turns.find_all do |turn|
      turn.correct?
    end

    return (correct_turns.length.to_f / @turns.length.to_f) * 100
  end

  def percent_correct_by_category(specific_category)
    correct_by_category = @turns.find_all do |turn|
     turn.correct? && turn.card.category == specific_category 
    end

    percentage_by_category = (correct_by_category.length.to_f / deck.cards_in_category(specific_category).length.to_f) * 100
    return percentage_by_category.to_i
  end
end
 