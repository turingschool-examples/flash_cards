require './lib/helper.rb'

class FlashcardRunner
  def initialize(round, deck, cards)
    @round = round
    @deck = deck
    @cards = cards
  end

  def start
    puts messages[:start]
    question
  end

  def question
    puts messages[:count]
    puts messages[:question]
    assess_answer
  end

  def assess_answer
    guess = gets.chomp.downcase
    @round.take_turn(guess)
    assess_next_step
  end

  def assess_next_step
    return question if round.turns.count < 4
    return messages[:game_over] if round.turns.count == 4
  end

  def messages
   {
     start:
     "Welcome! You're playing with 4 cards.
     -------------------------------------------------",
     count:
     "This is card number #{@round.turn_count + 1} out of 4.",
     question:
     "Question: #{@round.current_card.question}",
     game_over:
     "****** Game over! ******
     You had #{@round.number_correct} correct guesses out of 4 for a total score of #{@round.percent_correct}%.
     STEM - #{@round.percent_correct_by_category('STEM')}% correct
     Turing Staff - #{@round.percent_correct_by_category('Turing Staff')}% correct
     Pop Culture - #{@round.percent_correct_by_category('Pop Culture')}% correct"
   }
  end
end
