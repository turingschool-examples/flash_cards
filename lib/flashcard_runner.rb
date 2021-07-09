require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("Who is the greatest quarterback of all time?", "Tom Brady", :NFL)
card_2 = Card.new("What town in Maine is Henry from?", "Cumberland", :Henry)
card_3 = Card.new("What fruit is a hybrid of tangerines and pomelos?", "orange", :Fruit)
card_4 = Card.new("What is Mac Jones' middle name?", "McCorkle", :NFL)
@cards = [card_1, card_2, card_3, card_4]
@deck = Deck.new(@cards)
@round = Round.new(@deck)


puts "Welcome! You're playing with #{@cards.length} cards.\n-------------------------------------------------"

def play_flashcards
  while @round.turns.length < @cards.length
    puts "This is card number #{@round.turns.length + 1} out of #{@cards.length}."
    puts "Question: #{@round.current_card.question}"
    print "Answer: "

    guess = gets.chomp
    turn = @round.take_turn(guess)

    puts turn.feedback
    puts "-------------------------------------------------"
  end

play_flashcards
