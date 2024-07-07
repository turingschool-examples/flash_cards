

require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'


card_1 = Card.new("What is 20 + 8?", "28", :STEM)
card_2 = Card.new("What is Sabrina's favorite animal?", "Dog", :"Personal")
card_3 = Card.new("What is Sabrina's middle name?", "Lynn", :"Turing Staff")
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_Culture)
card_5 = Card.new("Was this project hard?", "Yes", :"Group_consensus")


deck = Deck.new([card_1, card_2, card_3, card_4, card_5])


round = Round.new(deck)


def start_round(round)
  puts "Welcome! You're playing with #{round.deck.count} cards."
  puts "-------------------------------------------------"

  round.deck.cards.each_with_index do |card, index|
    puts "This is card number #{index + 1} out of #{round.deck.count}."
    puts "Question: #{card.question}"

    print "Your answer: "
    user_answer = gets.chomp

    turn = round.take_turn(user_answer)

    if turn.correct?
      puts "Correct!"
    else
      puts "Incorrect."
    end

    puts "-------------------------------------------------"
  end

  puts "****** Game over! ******"
  puts "You had #{round.number_correct} correct guesses out of #{round.deck.count} for a total score of #{round.percent_correct}%."

  round.deck.cards.map(&:category).uniq.each do |category|
    percent_correct = round.percent_correct_by_category(category)
    puts "#{category.to_s.gsub('_', ' ')} - #{percent_correct}% correct"
  end
end


start_round(round)

