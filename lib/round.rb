class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_number = 0
    @number_correct = 0
  end

  def current_card
    deck.cards[@turn_number]
  end

  
  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turn_number += 1
    @number_correct += 1 if turn.correct?
    @turns << turn
    turn
  end

  def number_correct_by_category(category)
    category_array = turns.select do |turn|
      turn.card.category == category && turn.correct?
    end
    category_array.count
  end

  def percent_correct
    percent = (@number_correct / @turn_number.to_f) * 100
    percent.round(2)
  end

  def percent_correct_by_category(category)
    num_correct = number_correct_by_category(category)
    num_in_category = deck.cards_in_category(category).length
    percent = (num_correct / num_in_category.to_f) * 100
    percent.round(2)
  end

  def start
    puts "Welcome! You're playing Trivia with a deck of #{deck.count} cards."
    puts "---------------------------------------------------"
    
    deck.cards.each do |card|
      puts "This is card number #{@turn_number + 1} out of #{deck.count} cards."
      puts "Question: #{deck.cards[@turn_number].question}"
      guess = gets.chomp
      turn = take_turn(guess)
      puts turn.feedback
      puts "-- -- -- -- -- -- -- -- -- -- -- -- --"
    end
    
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{deck.count} cards, for a totale score of #{percent_correct}%"
    puts "Animal - #{percent_correct_by_category(:animal)}% correct"
    puts "Food - #{percent_correct_by_category(:food)}% correct"
    puts "Geography - #{percent_correct_by_category(:geography)}% correct"
    puts "Programming - #{percent_correct_by_category(:programming)}% correct"
  end
end