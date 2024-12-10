require_relative 'card'
require_relative 'deck'
require_relative 'round'
require_relative 'turn'


card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "panda", :Turing_Staff)
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_Staff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_Culture)

card_5 = Card.new("What is the method to return a boolean on whether an object is even", ".even?", :Ruby)
card_6 = Card.new("What is the return of 2.odd?", "false", :Ruby)
card_7 = Card.new("What does a @ represent before a variable?", 'instance variable', :Ruby)
card_8 = Card.new("What does a method ending in a ? return?", "boolean", :Ruby)

deck = Deck.new([card_1, card_2, card_3, card_4])
deck_2 = Deck.new([card_5, card_6, card_7, card_8])

round = Round.new(deck)
round_2 = Round.new(deck_2)


def start(round)
  puts "Welcome! You're playing with #{round.deck.cards.count} cards."
  puts "-------------------------------------------------"

  round.deck.cards.each_with_index do |card, index|
    puts "This is card number #{index + 1} out of #{round.deck.cards.count}."
    puts "Question: #{card.question}"

    print "> "
    guess = gets.chomp
    turn = round.take_turn(guess)

    puts turn.feedback
  end

  puts "****** Game over! ******"
  puts "You had #{round.number_correct} correct guesses out of #{round.turns.count} for a total score of #{round.percent_correct}%."

  round.deck.cards.map{ |card| card.category }.uniq.each do |category|
    puts "#{category} - #{round.percent_correct_by_category(category)}% correct"
  end
  puts round.percent_correct
end


start(round)
start(round_2)



