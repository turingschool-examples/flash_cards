class Round
  attr_reader :deck, :turns, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @current_card = @deck.cards[@turns.count]
    turn
  end

  def number_correct
    @turns.count { |turn| turn.correct? }
  end

  def number_correct_by_category(category)
    @turns.count { |turn| turn.card.category == category && turn.correct? }
  end

  def percent_correct
    (number_correct.to_f / @turns.count) * 100
  end

  def percent_correct_by_category(category)
    total_in_category = @turns.count { |turn| turn.card.category == category }
    return 0 if total_in_category == 0
    (number_correct_by_category(category).to_f / total_in_category) * 100
  end

  def start
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
    
    categories = deck.cards.map(&:category).uniq
    categories.each do |category|
      puts "#{category} - #{percent_correct_by_category(category).to_i}% correct"
    end
  end
end