require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

card_5 = Card.new("What type of meat is chashu?", "pork", :Food)
card_6 = Card.new("Are heirloom tomatoes determinate or indeterminate?", "indeterminate", :Garden)
card_7 = Card.new("What type of plant uses bacterial nodes to fix nitrogen in the soil?", "legume", :Garden)
card_8 = Card.new("What type of bones are used to make ramen broth?", "neck bones", :Food)
card_9 = Card.new("What is the name for the cooking method that involves cooking at a consistent temperture in a water bath", "sous vide", :Food)

@deck = Deck.new([card_5, card_6, card_7, card_8, card_9])
@round = Round.new(@deck)
#binding.pry
def start
  puts "Welcome! You're playing with 5 cards."
  puts "-----------------------------------"
  puts "-----"
  #should i get the card number in a different way


  #@deck.cards.map do |card|
  card_number = 1
  #I want to change the line below to work based on the actual number of cards
    #@deck.count.times do
  #@deck.cards.each do |card|
  @deck.count.times do
    puts "This is card number #{card_number} out of #{@deck.count}"
    puts "Question: #{@round.current_card.question}"
    answer = gets.chomp
    @round.take_turn(answer)
    puts @round.turns.last.feedback
    card_number +=1
  end


  puts "****** Game over! ******"
  #i would like to change 5 to be dependent on an input also
  puts "You had #{@round.number_correct} guesses out of 5 for a total score of
  #{@round.percent_correct}%"


  #binding.pry
  results = []
  @round.deck.cards.each do |card|
    results << card.category
  end

  results_uniq = results.uniq
  #binding.pry
  results_final = ""
  results_uniq.each do |result|
    results_final = result
  end

  final_result = ""
  results_uniq.each do |category|
    puts "#{category} - #{@round.percent_correct_by_category(category)}% correct"
    #binding.pry
  end

end

start

    #should i get the card number in a different way
#   puts "This is card number 2 out of #{@deck.count + @round.turns.count}"
#   puts "Question: #{@round.current_card.question}"
#
# end
