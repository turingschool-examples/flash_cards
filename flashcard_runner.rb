require './lib/card'   # => true
require './lib/turn'   # => true
require './lib/deck'   # => true
require './lib/round'  # => true

card_1 = Card.new("What are acceptable reasons for discharge or transfer?", "Medical reasons", :CLIENT)                        # => #<Card:0x00007ff836038690 @question="What are acceptable reasons for discharge or transfer?", @answer="Medical reasons", @category=:CLIENT>
card_2 = Card.new("Patients have the right to be free from restraints unless what is obtained?", "Authorized order", :CLIENT)  # => #<Card:0x00007ff836038320 @question="Patients have the right to be free from restraints unless what is obtained?", @answer="Authorized order", @category=:CLIENT>
card_3 = Card.new("the ability to understand the feelings of another without pitying them", "Empathy", :COMMUNICATION)         # => #<Card:0x00007ff836038050 @question="the ability to understand the feelings of another without pitying them", @answer="Empathy", @category=:COMMUNICATION>
card_4 = Card.new("The “Resident’s Bill of Rights” was put out by which group?", "AHA", "Ethical Behavior")                    # => #<Card:0x00007ff83411bb40 @question="The “Resident’s Bill of Rights” was put out by which group?", @answer="AHA", @category="Ethical Behavior">
cards = [card_1, card_2, card_3, card_4]                                                                                       # => [#<Card:0x00007ff836038690 @question="What are acceptable reasons for discharge or transfer?", @answer="Medical reasons", @category=:CLIENT>, #<Card:0x00007ff836038320 @question="Patients have the right to be free from restraints unless what is obtained?", @answer="Authorized order", @category=:CLIENT>, #<Card:0x00007ff836038050 @question="the ability to understa...
deck = Deck.new(cards)                                                                                                         # => #<Deck:0x00007ff83411add0 @cards=[#<Card:0x00007ff836038690 @question="What are acceptable reasons for discharge or transfer?", @answer="Medical reasons", @category=:CLIENT>, #<Card:0x00007ff836038320 @question="Patients have the right to be free from restraints unless what is obtained?", @answer="Authorized order", @category=:CLIENT>, #<Card:0x00007ff836038050 @...
round = Round.new(deck)                                                                                                        # => #<Round:0x00007ff8341197c8 @turns=[], @correct=0, @deck=#<Deck:0x00007ff83411add0 @cards=[#<Card:0x00007ff836038690 @question="What are acceptable reasons for discharge or transfer?", @answer="Medical reasons", @category=:CLIENT>, #<Card:0x00007ff836038320 @question="Patients have the right to be free from restraints unless what is obtained?", @answer="Authorized...

total_cards = round.turns.count + cards.count              # => 4
total_rounds = round.deck.cards + round.turns              # => [#<Card:0x00007ff836038690 @question="What are acceptable reasons for discharge or transfer?", @answer="Medical reasons", @category=:CLIENT>, #<Card:0x00007ff836038320 @question="Patients have the right to be free from restraints unless what is obtained?", @answer="Authorized order", @category=:CLIENT>, #<Card:0x00007ff836038050 @question="the ability to understand the feelings of another without pitying them", @answer="Empathy",...
puts "Welcome! You're playing with #{total_cards} cards."  # => nil
puts '-' * 51                                              # => nil

num = 0                                                         # => 0
total_rounds.each do |card|                                     # => [#<Card:0x00007ff836038690 @question="What are acceptable reasons for discharge or transfer?", @answer="Medical reasons", @category=:CLIENT>, #<Card:0x00007ff836038320 @question="Patients have the right to be free from restraints unless what is obtained?", @answer="Authorized order", @category=:CLIENT>, #<Card:0x00007ff836038050 @question="the ability to understand the feelings of another without pitying them", @answer="Empa...
  puts "This card is number #{num += 1} out of #{total_cards}"  # => nil
  puts "Question: #{card.question}"                             # => nil
  user_answer = gets.chomp                                      # ~> NoMethodError: undefined method `chomp' for nil:NilClass
  guess = round.take_turn(user_answer)
  puts guess.feedback
end

puts "****** Game Over! ******"
puts "You had #{round.correct} correct guesses out of #{total_cards} "


# >> Welcome! You're playing with 4 cards.
# >> ---------------------------------------------------
# >> This card is number 1 out of 4
# >> Question: What are acceptable reasons for discharge or transfer?

# ~> NoMethodError
# ~> undefined method `chomp' for nil:NilClass
# ~>
# ~> flashcard_runner.rb:23:in `block in <main>'
# ~> flashcard_runner.rb:20:in `each'
# ~> flashcard_runner.rb:20:in `<main>'
