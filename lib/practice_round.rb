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
    @new_turn = Turn.new(guess, current_card)
    @turns << @new_turn
    @deck.cards.rotate!(1)
    @new_turn
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  
  def number_correct_by_category(category)  # will count the return value of iteration. 
    @turns.count do |turn|
      turn.correct? && turn.card.category == category 
    end
  end

  def percent_correct
    (number_correct.to_f / @turns.count.to_f) * 100
  end

  # def guess_by_category(category)
  #   turns.each do |turn|
  #     turn.card.category
  #   end
  # end

  def percent_correct_by_category(category)
    (number_correct_by_category(category) / @deck.cards_in_category(category).count.to_f) * 100
  end

end

# end

  
    
      # #
      # #I need to iterate on @turns to isolate correct turns.
      #   #isolate category
      #   #count correct guesses cards with category
      #   def number_correct_by_category(category)
      #     correct_categories_count = {}
      #     @turns.each do |turn|
      #       # if the turn is correct
      #       # and has the correct category of category being passed in the argument,
      #       # and our hash does not already have that category as a key
      #       # the key/#value pair gets added to our hash with a value of 1
      #       if turn.correct? && turn.card.category == category && !correct_categories_count.has_key?(category) 
      #         correct_categories_count[turn.card.category] = 1
      
      #       #if turn is correct and the category already exists in our hash, then
      #       # a number gets added to our hash value for that category
      #       elsif turn.correct? && turn.card.category == category
      #         correct_categories_count[turn.card.category] += 1
      
      #       # if the category matches the category being passed and the turn is not correct
      #       # adds the category to the hash with a value of zero
      #       elsif turn.card.category == category && !turn.correct? #second operator doesn't NEED to be here
      #         correct_categories_count[category] = 0
      #       end
      #     end
      #     correct_categories_count[category]
      
      #       #does the correct_count.include? category
      #   end
      # # 