require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

  @card_1 = Card.new("What is the capital of Michigan?", "lansing", :Geography)
  @card_2 = Card.new("Which NHL team has won the most Stanley Cups (city + team name)?","montreal canadiens",:Sports)
  @card_3 = Card.new("Which musician recently had a movie released about his life starring Taron Egerton and Richard Madden?","elton john",:Music)
  @card_4 = Card.new("Which band's original name was 'Sweet Children'?","green day",:Music)
  @cards = [@card_1, @card_2, @card_3, @card_4]
  @deck = Deck.new(@cards)
  @round = Round.new(@deck)

puts ""
puts "Welcome! You're playing with #{@deck.count} cards."
puts "-" * 50


card_num = 1
@cards.map do |card|
  puts "This is card number #{card_num} out of #{@deck.count}."
  puts "Question: #{@round.current_card.question}"
  puts "Your guess:"
  @round.take_turn(gets.chomp.downcase)
  puts "#{@round.turns.last.feedback}"
  card_num += 1
end

puts ""
puts "*" * 6 + "Game over!" + "*" * 6
puts "You had #{@round.number_correct} correct guesses out of #{@deck.count} for a total score of #{@round.percent_correct}%."
puts "Geography - #{@round.percent_correct_by_category(:Geography)}%"
puts "Sports - #{@round.percent_correct_by_category(:Sports)}%"
puts "Music - #{@round.percent_correct_by_category(:Music)}%"
