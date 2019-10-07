require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

  @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  @card_2 = Card.new("What has a positive charge in an atom?", "Proton", :STEM)
  @card_3 = Card.new("What is the square root of 144?", "12", :STEM)
  @card_4 = Card.new("What is the name of Arya Stark's sword gifted by Jon Snow?", "Needle", :Got_Trivia)
  @card_5 = Card.new("What is the name of the place the Starks are from?", "Winterfell", :Got_Trivia)
  @card_6 = Card.new("What is the largest desert on planet Earth? (It's a trick question.)", "Antarctica", :Geography)

  @cards = [@card_1, @card_2, @card_3, @card_4, @card_5, @card_6]
  @deck = Deck.new(@cards)
  @round = Round.new(@deck)
  @total_cards = @cards.count

  puts "Welcome to Flashcards! You're playing with #{@total_cards} cards."

def start
  @total_cards.times do |turn|
    puts "-------------------------------------"
    puts "This is card number #{turn + 1} out of #{@total_cards}."
    puts "Question: #{@round.current_card.question}"

    guess = @round.take_turn(gets.chomp.capitalize)

    if guess.correct?
      puts "#{@round.turns.last.feedback}"
    else
      puts "#{@round.turns.last.feedback}"
      puts "The answer is #{@round.turns.last.card.answer}"
    end
  end

end
start

puts "****** Game over! ******"
puts "Here is how you did overall:"
puts "You had #{@round.number_correct} correct guesses out of #{@total_cards} for a total score of #{@round.percent_correct}%."
puts "------------------------------------------------------------------------------------------------------------------------"
puts "And here is how you did by category:"
puts "STEM - #{@round.percent_correct_by_category(:STEM)}%"
puts "Geography - #{@round.percent_correct_by_category(:Geography)}%"
puts "GoT Trivia - #{@round.percent_correct_by_category(:Got_Trivia)}%"






