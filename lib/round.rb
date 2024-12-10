# The Round class handles the flow of the game.
# It manages turns, tracks guesses, and provides feedback and results.
class Round
  attr_reader :deck, :turns, :current_card_index

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card_index = 0
  end

  # Returns the current card being played
  def current_card
    @deck.cards[@current_card_index]
  end

  # Processes a guess, creates a Turn, and moves to the next card
  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @current_card_index += 1
    turn
  end

  # Returns the total number of correct guesses
  def number_correct
    @turns.count { |turn| turn.correct? }
  end

  # Returns the number of correct guesses in a specific category
  def number_correct_by_category(category)
    @turns.count { |turn| turn.correct? && turn.card.category == category }
  end

  # Returns the percentage of correct guesses
  def percent_correct
    (number_correct.to_f / @turns.count * 100).round(1)
  end

  # Returns the percentage of correct guesses in a specific category
  def percent_correct_by_category(category)
    total_in_category = @turns.count { |turn| turn.card.category == category }
    return 0.0 if total_in_category.zero?

    (number_correct_by_category(category).to_f / total_in_category * 100).round(1)
  end

  # CLI: Starts the game and handles user interaction
  def start
    puts "Welcome! You're playing with #{deck.count} cards."
    puts "-------------------------------------------------"

    deck.cards.each_with_index do |card, index|
      puts "This is card number #{index + 1} out of #{deck.count}."
      puts "Question: #{card.question}"

      # Get user input for their guess
      guess = gets.chomp
      turn = take_turn(guess)

      # Provide feedback on their guess
      puts turn.feedback
    end

    # Display final results
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{turns.count} for a total score of #{percent_correct}%."

    # Display performance by category
    deck.cards.map(&:category).uniq.each do |category|
      puts "#{category} - #{percent_correct_by_category(category)}% correct"
    end
  end
end
