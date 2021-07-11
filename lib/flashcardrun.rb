class FlashCardRun
#
  def initialize(round)
    @round = round
    @deck = round.deck
    @current_question = round.current_card.question
  end

#running the game
  def start(round)
    welcome

    until round.deck.cards.length == 0 do
      turn_message(round)
      get_guess(round)
      puts round.turns.last.feedback
    end

    game_over(round)
  end

#welcome message
  def welcome
    puts "Welcome! You're playing with #{@deck.count} cards."
    puts "-------------------------------------------------"
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

#final message when all cards are used
  def game_over(round)
    puts "****** Game over! ******"
    puts "You had #{round.number_correct} correct guesses out of #{round.turns.length} for a total score of #{round.percent_correct}%!"
  end

  # def find_categories
  #   @turns.card.find_all do |card|
  # end
end
