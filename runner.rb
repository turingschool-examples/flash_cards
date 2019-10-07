require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

@card1 = Card.new("In what state was John Wayne born?", "Iowa", :Places)
@card3 = Card.new("What is the capital of Djibouti?", "Djibouti", :Places)
@card3 = Card.new("Where did Neil Armstrong set foot in 1969?", "Moon", :Places)
@card4 = Card.new("What is the square root of 4?", "2", :Math)
@card5 = Card.new("What amount makes a baker's dozen?", "13", :Math)
@card6 = Card.new("How many toes does the average human have?", "10", :Math)

@cards = [@card1, @card2, @card3, @card4, @card5, @card6]
@card_total = @cards.count

@deck = Deck.new(@cards)
@round = Round.new(@deck)

def start

  puts "Welcome! You're playing with #{@deck.count} cards."
  puts "~" * 50

  until @round.turns.count == @card_total
    puts "This is question #{@round.turns.count + 1}. (Category = #{@deck.cards.first.category})"
    puts "Question: #{@round.current_card.question}"
    puts "Answer: "

    @round.take_turn(gets.chomp.capitalize)

    if @round.turns.last.correct? == true
      puts "#{@round.turns.last.feedback}"
    else
      puts "#{@round.turns.last.feedback} The correct answer is #{@round.turns.last.card.answer}."
    end

    puts "-" * 50
  end

#  puts "******* Game Over! *******"
#  puts "You had #{@round.number_correct.to_i} correct guesses out of #{@card_total} for a total score of #{@round.percent_correct.to_i}%."
#  puts "Places - #{@round.percent_correct(:Places)}% correct."
#  puts "Math - #{@round.percent_correct(:Math)}% correct."
# end

start
