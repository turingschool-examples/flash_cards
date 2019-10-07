require_relative './lib/card'
require_relative './lib/turn'
require_relative './lib/deck'
require_relative './lib/round'

card_a = Card.new("What kind of lettuce is in a Caesar salad?", "romaine", :Food)
card_b = Card.new("In what sport can you get a Grand Slam?", "baseball", :Sports)
card_c = Card.new("What is the healthiest color of corn?", "blue", :Food)
card_d = Card.new("In what sport can you score a 'touchdown'?", "football", :Sports)
card_e = Card.new("Is this question a boolean, yes or no?", "yes", :Programming)

@deck = Deck.new([card_a, card_b, card_c, card_d, card_e])
@round = Round.new(@deck)
def start
  puts "Welcome! You're playing with 5 cards."
  puts "-----------------------------------"


  card_number = 1
  5.times do
    puts "This is card number #{card_number} out of #{@deck.count}"
    puts "Question: #{@round.current_card.question}"
    #asks user for input
    answer = gets.chomp
    #stores user input into take_turn method from round class
    @round.take_turn(answer)
    #outputs if answer is correct using feedback method from turn class
    puts @round.turns.last.feedback
    card_number +=1
  end


  puts "****** Game Over! ******"
  puts "You had #{@round.number_correct} guesses out of 5 for a total score of
  #{@round.percent_correct}%"


  results = []
  @round.deck.cards.each do |card|
    results << card.category
  end
#tried using unique to output single results without duplicates for each
#category, but doesn't work if first answer in that category is wrong
  results.uniq.each do |category|
    puts "#{category} - #{@round.percent_correct_by_category(category)}% correct"
  end

end

start
