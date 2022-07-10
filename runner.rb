require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

def start
  card_1 = Card.new("What is the square root of 49?","7", :STEM)
  card_2 = Card.new("What is Shohei's favorite pitch", "Splitter", :Pop_Culture)
  card_3 = Card.new("Where is there 12 hours of sunlight during the equinox", "The Equator", :Geography)
  card_4 = Card.new("What is a Giant Panda's favorite food", "Bamboo", :Pop_Culture)

  deck = Deck.new([card_1, card_2, card_3, card_4])
  round = Round.new(deck)

  puts "Welcome to flashcards. Come test your knowledge with #{deck.cards.count} cards."
  puts ("----------")

  card_number = 0
  deck.cards.each do |card|
    card_number +=1
    puts card.question
    guess = gets.chomp.to_s
    round.take_turn(guess)
    round.turns.last.correct?
    puts round.turns.last.feedback

    if card_number == deck.count
      puts "Game Over!"
      puts "You had #{round.number_correct} out of #{deck.count} for a total score of #{round.percent_correct}%."
      puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
      puts "Geography - #{round.percent_correct_by_category(:Geography)}% correct"
      puts "Animals - #{round.percent_correct_by_category(:Animals)}%"

      puts "Now go study more!"
    end
  end
end

start
