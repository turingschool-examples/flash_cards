require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

@card1 = Card.new("What is the capital of South Dakota?", "Pierre", :Capitals)
@card2 = Card.new("What is 5 + 4 * 3", "17", :Math)
@card3 = Card.new("What is the capital of Poland?", "Warsaw", :Capitals)
@card4 = Card.new("In the equation 'x - 10 + 2 = 4', what is x equal to?", "12", :Math)
@card5 = Card.new("How many seasons of the office are there?", "9", :The_office)
@card6 = Card.new("What or who does Michael Scott hate more than anything?", "Toby", :The_office)

@cards = [@card1, @card2, @card3, @card4, @card5, @card6]
@card_total = [@card1, @card2, @card3, @card4, @card5, @card6].count

@deck = Deck.new(@cards)

@round = Round.new(@deck)

def start
  
  puts "Welcome! You're playing with #{@deck.count} cards."
  puts "~" * 40

  until @round.turns.count == @card_total
    puts "This is question #{@round.turns.count + 1}. (Category = #{@deck.cards.first.category})"
    puts "Question: #{@deck.cards.first.question}"
    print "Answer: "

    @round.take_turn(gets.chomp.capitalize)

    if @round.turns.last.correct? == true
      puts "#{@round.turns.last.feedback}"
    else
      puts "#{@round.turns.last.feedback} The correct answer is #{@round.turns.last.card.answer}."
    end

    puts "-" * 40
  end

  puts "******* Game Over! *******"
  puts "You had #{@round.number_correct.to_i} correct guesses out of #{@card_total} for a total score of #{@round.percent_correct.to_i}%."
  puts "Capitals - #{@round.percent_correct_by_category(:Capitals)}% correct."
  puts "Math - #{@round.percent_correct_by_category(:Math)}% correct."
  puts "The Office - #{@round.percent_correct_by_category(:The_office)}% correct."
end

start
