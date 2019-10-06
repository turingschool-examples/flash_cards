require './lib/deck'
require './lib/card'
require './lib/round'
require './lib/turn'

    @card_1 = Card.new("What is Princess Leia's home planet?", "Alderaan", :StarWars)
    @card_2 = Card.new("What planet are Ewoks from?", "Endor", :StarWars)
    @card_3 = Card.new("Who was the first American woman in space?", "Sally Ride", :STEM)
    @card_4 = Card.new("Who was the first man on the moon?", "Neil Armstrong", :STEM)
    @card_5 = Card.new("What is the fastest land mammal?", "Cheetah", :STEM)
    @card_6 = Card.new("Darth Vader accuses Leia of being part of what?", "The Rebel Alliance", :StarWars)
    @cards  = [@card_1, @card_2, @card_3, @card_4, @card_5, @card_6]
    @deck   = Deck.new(@cards)
    @round  = Round.new(@deck)
    @card_total = @cards.count

puts "Welcome! You are playing with #{@round.deck.count} cards."

def start
  until @round.turns.count == @card_total
    puts "~" * 50
    puts "This is card number #{@round.turns.count + 1} of 5."
    puts "Question: #{@round.current_card.question}"
    player_guess = @round.take_turn(gets.chomp)
      if player_guess.correct?
        puts "#{@round.turns.last.feedback}"
      else
        puts "The correct answer is #{@round.turns.last.card.answer}"
      end
    end

  puts "****** Game over! ******"
  puts "You had #{@round.number_correct} out of #{@card_total} correct for a total score of #{@round.percent_correct}%."
  puts "Star Wars - #{@round.percent_correct_by_category(:StarWars)}% correct."
  puts "STEM - #{@round.percent_correct_by_category(:STEM)}% correct."
end

start
