require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

# Create game resources

card = Card.new("What is 5 + 5?", "10", :Math)
card2 = Card.new("When did World War II officially end?", "1945", :History)
card3 = Card.new("What is the most popular framework for Ruby to quickly create a backend system for a webapp?", "Ruby on Rails", :Ruby)
card4 = Card.new("In majority of programming languages, they're called Functions. In Ruby, they're called _____", "Methods", :Ruby)
cards = [card, card2, card3, card4]
deck = Deck.new(cards)
round = Round.new(deck)


def start(round, deck)
  arr_of_cats = round.deck.cards.collect do |card|
    card.category
  end
  arr_of_cats = arr_of_cats.uniq
  puts "Welcome! You're playing with #{deck.count} cards."
  puts '-------------------------------------------------'
  total_cards = deck.count
  round.deck.count.times do |i|
    puts "This is card number #{i+1} out of #{total_cards}"
    puts "Question: #{round.current_card.question}"
    input = gets.chomp
    round.take_turn(input)
    puts round.turns[i].feedback
  end

  puts "****** Game over! ******"
  puts "You had #{round.number_correct} correct guesses out of #{total_cards} for a total score of #{round.percent_correct}%."
  arr_of_cats.each do |cat|
    puts "#{cat.to_s} - #{round.percent_correct_by_category(cat)}% correct"
  end
end

start(round, deck)
