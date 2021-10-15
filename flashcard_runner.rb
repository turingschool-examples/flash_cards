require './lib/card'
require './lib/turn'
require './lib/round'
require './lib/deck'

card_1 = Card.new("What is 100 - 47?", "53", :Math)
card_2 = Card.new("How do you say hello in Spanish?", "Hola", :Spanish)
card_3 = Card.new("Who is the leader of the Greek Pantheon?", "Zeus", "Mythology")
card_4 = Card.new("Who is the hero who fought the Medusa?", "Perseus", "Mythology")
card_5 = Card.new("What is the remainder of 100 divided by 3?", "1", :Math)

cards = [card_1, card_2, card_3, card_4, card_5]
deck = Deck.new(cards)
round = Round.new(deck)

puts "Welcome! You're playing with #{deck.count} cards."
37.times{print "-"}
print "\n"

def start(round)
    round.deck.cards.each do |i|
      puts "This is card number #{round.turn_num} of #{round.deck.count}"
      puts "Question: #{i.question}"
      answer = gets.chomp
      my_turn = round.take_turn(answer)
      puts my_turn.feedback
    end

    puts "****** Game Over! ******"
    puts "You had #{round.number_correct} out of #{round.deck.count} for a total score of #{round.percent_correct.to_i}%"

    included_categories = []
    round.deck.cards.each do |i|
      if included_categories.include?(i.category) == false
        puts "#{i.category} - #{round.percent_correct_by_category(i.category).to_i}% correct"
        included_categories << i.category
      end
    end
end

start(round)
