# Round class definition.

class Round
attr_accessor :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  # Round#current_card returns the current card to be answered.
  def current_card
    @deck.cards[@turns.count]
  end

  # Round#take_turn shovels the @turns array with the current turn, and returns the turn.
  def take_turn(guess)
    return_turn = Turn.new(guess, current_card)
    @turns << return_turn
    return_turn
  end

  # Round#number_correct returns the amount of correct turns.
  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  # Round#number_correct_by_category returns the amount of correct turns for a category.
  def number_correct_by_category(category_select)
    # Count the cards that are in the selected category and are guessed correct.
    @turns.count do |turn|
      turn.correct? && turn.card.category == category_select
    end
  end

  # Round#percent_correct returns the percentage of correct turns.
  def percent_correct
    # Check for divide by zero. Than calculate the percentage otherwise.
    if @turns.size == 0
      0.0
    else
      # Calculate percentage, truncate value to one decimal place.
      ((number_correct.to_f / @turns.size.to_f) * 100.0).truncate(1)
    end
  end
  
  # Round#percent_correct_by_category returns the percentage of correct turns for a category.
  def percent_correct_by_category(category_select)
    # Count the current cards in the turns that match the category selected. 
    current_cards_category = @turns.count do |element|
      element.card.category == category_select
    end
    # Check for divide by zero. Than calculate the percentage otherwise.
    if @turns.size == 0 || current_cards_category == 0
      0.0
    else
      # Create numerator and denominator values.
      numerator = number_correct_by_category(category_select).to_f 
      denominator = current_cards_category.to_f
      
      # Calculate percentage, truncate value to one decimal place.
      ((numerator / denominator) * 100.0).truncate(1)
    end
  end
end