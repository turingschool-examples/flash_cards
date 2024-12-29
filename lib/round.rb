class Round
  attr_reader :deck, :turns, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards.first
  end

  def take_turn(guess) #method to take a turn that accepts a string representing the guess
    turn = Turn.new(guess, current_card) #creates a new Turn object with the appropriate guess and Card
    @turns << turn #stores the new Turn in the @turns array
    @current_card = @deck.cards[@turns.count] #increments the current_card to the next card in the deck
    turn
  end

  def number_correct
    @turns.count { |turn| turn.correct? } #iterates over the turns and counts the number of correct guesses
  end

  def number_correct_by_category(category) #method that takes a category as an argument and returns the number of correct guesses in that category
    @turns.count { |turn| turn.card.category == category && turn.correct? } #iterates over the turns and counts the number of correct guesses in the given category
  end

  def percent_correct
    (number_correct.to_f / @turns.count) * 100 #calculates the percentage of correct guesses - to_f is used to convert the integer to a float
  end

  def percent_correct_by_category(category)
    total_in_category = @turns.count { |turn| turn.card.category == category } #iterates over the turns and counts the number of guesses in the given category
    return 0 if total_in_category == 0
    (number_correct_by_category(category).to_f / total_in_category) * 100
  end

  def start #method that starts the game
    puts "Welcome! You're playing with #{deck.count} cards."
    puts "-------------------------------------------------"
    
    deck.cards.each_with_index do |card, index|
      puts "This is card number #{index + 1} out of #{deck.count}."
      puts "Question: #{card.question}"
      guess = gets.chomp
      turn = take_turn(guess)
      puts turn.feedback
    end

    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{deck.count} for a total score of #{percent_correct.to_i}%."
    
    categories = deck.cards.map(&:category).uniq #gets the unique categories from the deck
    categories.each do |category|
      puts "#{category} - #{percent_correct_by_category(category).to_i}% correct" #prints the percentage of correct guesses for each category
    end
  end
end