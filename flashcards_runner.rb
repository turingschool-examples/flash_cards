require 'pry'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/turn.rb'

puts "###################################################"

card1 = Card.new('What is the in-between dimension in Half Life?', 'Zen', :HalfLife)
card2 = Card.new('Wake up and smell the: ?', 'Ashes', :HalfLife)
card3 = Card.new('Among us', 'Sus', :AmongUs)
card4 = Card.new('Red vented!', 'Sus', :AmongUs)

deck1 = Deck.new([card1, card2, card3, card4])
deck_length = deck1.cards.count()

round1 = Round.new(deck1)

puts "You are playing with #{deck_length} cards."

for i in 1..deck_length
    puts "---------------------------------------------------"

    puts "Card #{round1.turns.count()+1} of #{deck_length}:"
    puts round1.current_card.question
    user_input = gets
    turn = round1.take_turn(user_input.to_s.chomp!) # chomp! is nessissary
    puts turn.feedback
end

puts "###################################################"

puts "You got #{round1.number_correct} out of #{deck_length} with a grade of #{round1.percent_correct}%."
puts "Half Life: #{round1.percent_correct_by_category(:HalfLife)}%"
puts "Among Us: #{round1.percent_correct_by_category(:AmongUs)}%"