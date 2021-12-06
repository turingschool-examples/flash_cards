class Game
  attr_reader :round, :starting_deck

  def initialize(round)
    @round = round
    @starting_deck = round.deck.cards.size
  end

  # Moves game to next card and reads question to player.
  # runs #get_response
  def next_card
    p "This is card number #{round.turns.count + 1} out of #{@starting_deck}"
    p "Question: #{round.current_card.question}"
    get_response
  end

  # takes user input into game. formats input to match expected format for answers
  # prints feedback for correct/incorrect to player
  def get_response
    guess = gets.capitalize.chomp
    turn = Turn.new(guess, round.current_card)
    round.take_turn(guess)
    p turn.feedback
  end

  # prints final score and category scores when game is completed
  def game_over
    p "****** Game over! ******"
    p "You had #{round.correct_response.count} correct guesses out of #{@starting_deck} for a total score of #{round.percent_correct}%."
    @round.deck.categories_in_deck.each do |category|
      puts "#{category} - #{round.percent_correct_by_category(category)}% correct"
    end
    # Original hard-coded categories below. New refactored code above.
    # p "STEM - #{round.percent_correct_by_category('STEM')}% correct"
    # p "Sports - #{round.percent_correct_by_category('Sports')}% correct"
    # p "Geography - #{round.percent_correct_by_category('Geography')}% correct"
    # p "Fun Facts - #{round.percent_correct_by_category('Fun_Facts')}% correct"
  end

  # starts game and prints welcome message to player.
  # continues moving game to next card until all cards have been played.
  # runs #game_over when all cards have been played
  def start
    p "Welcome! You're playing with #{@starting_deck} cards."
    p "-------------------------------------------------"
    until @starting_deck == round.turns.count
      round.deck.cards.shuffle!
      next_card
    end
    game_over
  end
end
