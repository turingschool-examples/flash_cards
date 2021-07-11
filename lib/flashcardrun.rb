class FlashCardRun

  def initialize(round)
    @round = round
    @deck = round.deck
    @current_question = round.current_card.question
  end

#running the game
  def start(round)
    puts "Welcome! You're playing with #{@deck.count} cards."
    puts "-------------------------------------------------"

    until round.deck.cards.length == 0 do
      turn_message(round)
      get_guess(round)
      puts round.turns.last.feedback
    end

    game_over(round)
  end

#turn message - card x of 4, question
  def turn_message(round)
    puts "This is card number #{round.turns.length + 1} of #{@deck.count + round.turns.length}."
    puts "Question: #{round.current_card.question}?"
  end

#where i get user input for each guess
  def get_guess(round)
    new_guess = gets.chomp
    round.take_turn(new_guess)
  end

  def get_categories
    specific_categories = @round.turns.map do |turn|
      turn.card.category
    end
  end

#final message when all cards are used
  def game_over(round)
    puts "****** Game over! ******"
    puts "You had #{round.number_correct} correct guesses out of #{round.turns.length} for a total score of #{round.percent_correct.to_i}%."

    get_categories.uniq.each do |category|
      puts "#{category}- #{round.percent_correct_by_category(category).to_i}% correct"
    end
  end
end
