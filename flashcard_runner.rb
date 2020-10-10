require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

@card_1 = Card.new("What color is the sky?", "Blue", :Environment)
@card_2 = Card.new("What color are leaves?", "Green", :Environment)
@card_3 = Card.new("Which dog is cutest?", "Tina", :Dog)
@card_4 = Card.new("Which came first, the chicken or the egg?", "Egg", :Philosophy)
@deck = Deck.new([@card_1, @card_2, @card_3, @card_4])
@round = Round.new(@deck)
@count = @round.deck.cards.count

def start
  puts "Welcome! You're playing with #{@count} cards."
  puts "-------------------------------------------------------"

  until @round.deck.cards.count == 0
    puts "This is card number #{@round.turns.count+1} out of #{@count}"
    puts "Question: #{@round.current_card.question}"
    guess = gets.chomp
    puts @round.take_turn(guess).feedback
  end

  puts "********* Game Over! *********"
  puts "You had #{@round.number_correct} guesses out of #{@round.turns.count} for a total score of #{@round.percent_correct}"
  puts "Environment - #{@round.percent_correct_by_category(:Environment)}% correct"
  puts "Dog - #{@round.percent_correct_by_category(:Dog)}% correct"
  puts "Philosophy - #{@round.percent_correct_by_category(:Philosophy)}% correct "
end

start
