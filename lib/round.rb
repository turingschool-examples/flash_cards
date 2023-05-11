class Round
  
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_number = 0
    @number_correct = 0
  end

  def current_card
    @deck.cards[@turn_number]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turn_number += 1
    @number_correct += 1 if turn.correct?
    @turns << turn
    turn
  end

  def number_correct
    @turns.count { |turn| turn.correct? }
  end

  def number_correct_by_category(category)
    @turns.count { |turn| turn.card.category == category && turn.correct? }
  end

  def percent_correct
    (number_correct.to_f / @turns.size) * 100
  end

  def percent_correct_by_category(category)
    turns_in_category = @turns.count { |turn| turn.card.category == category }
    (number_correct_by_category(category).to_f / turns_in_category) * 100
  end

  def start
    puts "Welcome! You're playing with #{deck.count} cards."
    puts "-" * 37
    
    deck.cards.each do |card|
      puts "This is card #{@turn_number + 1} out of #{deck.count} cards."
      puts "Question: #{deck.cards[@turn_number].question}"
      guess = gets.chomp
      turn = take_turn(guess.downcase)
      puts turn.feedback
    end
    
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{deck.count} cards, for a totale score of #{percent_correct}%"
    puts "STEM - #{percent_correct_by_category(:stem)}% correct"
    puts "Turing Staff - #{percent_correct_by_category(:turing_staff)}% correct"
    puts "Pop Culture - #{percent_correct_by_category(:pop_culture)}% correct"
  end
end