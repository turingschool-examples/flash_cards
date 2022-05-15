# note to reader

# This is still a draft and needs work, I wrote the whole runner file
# without testing between steps while the process was fresh in my head

require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

@card_1 = Card.new("What is 5 + 5?", 10, :STEM)
@card_2 = Card.new("What is Rachel's favorite animal?", "Dog", :TuringStaff)
@card_3 = Card.new("What is Mike's middle name?", "nobody knows", :TuringStaff)
@card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :PopCulture)
@deck = Deck.new([@card_1, @card_2, @card_3, @card_4])
@round = Round.new(@deck)

def start
  @round.deck.count.times do
    puts "Welcome! You're playing with #{@deck.count} cards."
    puts "-------------------------------------------------"
    puts "This is card number #{@round.current_card} out of #{@round.deck.count}."
    puts "Question: #{@round.deck[0].question}"

    answer = gets.chomp

    if answer == @round.deck[0].answer
      puts answer
      puts "#{@round.turns.last.feedback}"
    else
      puts answer
      puts "#{@round.turns.last.feedback}"
    end
  end

  puts "****** Game over! ******"
  puts "You had #{@round.number_correct} correct guesses out of #{@round.deck.count} for a total score of #{@round.percent_correct}."
  puts "STEM - #{@round.percent_correct_by_category(:STEM).to_i}% correct"
  puts "Turing Staff - #{@round.percent_correct_by_category(:TuringStaff).to_i}% correct"
  puts "Pop Culture - #{@round.percent_correct_by_category(:PopCulture).to_i}% correct"
end
