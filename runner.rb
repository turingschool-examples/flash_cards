require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

def start
  card_1 = Card.new("What is 5 + 5?","10", :STEM)
  card_2 = Card.new("What is Rachel's favorite animal?", "Corgi", :Pop_Culture)
  card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_Staff)
  card_4 = Card.new("Who lives under a pineapple under the sea?", "Spongebob", :Pop_Culture)

  deck = Deck.new([card_1, card_2, card_3, card_4])
  round = Round.new(deck)

  puts "Welcome to flashcards. Come test your knowledge with #{deck.cards.count} cards."
  puts ("-" * 60)

  card_number = 0
  deck.cards.each do |card|
    card_number +=1
    puts "This is Card number #{card_number} out of #{deck.count}"
    puts card.question
    guess = gets.chomp.to_s
    round.take_turn(guess)
    round.turns.last.correct?
    puts round.turns.last.feedback

    if card_number == deck.count
      puts "Game Over!"
      puts "You had #{round.number_correct} out of #{deck.count} for a total score of #{round.percent_correct}%."
      puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
      puts "Turing Staff - #{round.percent_correct_by_category(:Turing_Staff)}% correct"
      puts "Pop Culture- #{round.percent_correct_by_category(:Pop_Culture)}%"

      puts "Now go study more!"
    end
  end
end

start
