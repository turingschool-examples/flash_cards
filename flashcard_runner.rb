require './lib/helper.rb'

class FlashcardRunner
  def initialize(round, deck, cards)
    @round = round
    @deck = deck
    @cards = cards
  end

  def start
    puts "Welcome! You're playing with 4 cards.
         -------------------------------------------------
         This is card number #{@round.turn_count + 1} out of 4."
    ask_question
  end

  def ask_question
    puts "Question: #{@round.current_card.question}"
    check_input
  end

  def check_input
    guess = gets.chomp.downcase
    @round.take_turn(guess)
    get_feedback
  end

  def get_feedback
    puts @round.turn_feedback
    if @round.turn_count == @deck.cards.size
      game_over
    else
      @round.card_complete
      ask_question
    end
    # game_over
  end

  def game_over
    puts "****** Game over! ******
     You had #{@round.number_correct} correct guesses out of 4 for a total score of #{@round.percent_correct}%.
     STEM - #{@round.percent_correct_by_category('STEM')}% correct
     Turing Staff - #{@round.percent_correct_by_category('Turing Staff')}% correct
     Pop Culture - #{@round.percent_correct_by_category('Pop Culture')}% correct"
  end
end
