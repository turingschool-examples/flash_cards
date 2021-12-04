class Game
  attr_reader :round, :starting_deck

  def initialize(round)
    @round = round
    @starting_deck = round.deck.cards.size
  end

  def next_card
    p "This is card number #{round.turns.count + 1} out of #{@starting_deck}"
    p "Question: #{round.current_card.question}"
    get_response
  end

  def get_response
    guess = gets.chomp
    turn = Turn.new(guess, round.current_card)
    round.take_turn(guess)
    p turn.feedback
  end

  def game_over
    p "****** Game over! ******"
    p "You had #{round.correct_guesses.count} correct guesses out of #{@starting_deck} for a total score of #{round.percent_correct}%."
    p "STEM - #{round.percent_correct_by_category('STEM')}% correct"
    p "Sports - #{round.percent_correct_by_category('Sports')}% correct"
    p "Geography - #{round.percent_correct_by_category('Geography')}% correct"
    p "Fun Facts - #{round.percent_correct_by_category('Fun_Facts')}% correct"
  end

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
