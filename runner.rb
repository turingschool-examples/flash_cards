require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require './lib/randomize'


def start
    # card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    # card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    # card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    # cards = [card_1, card_2, card_3]
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards
    deck = Deck.new(cards)
    round = Round.new(deck)
    randomize = Randomize.new(deck)


    puts "Welcome! You're playing with #{deck.count} cards."
    puts "_________________________________________________"
    while round.turn < deck.count
        puts "This is card number #{(round.turn + 1)} out of #{deck.count}"
        puts round.current_card(randomize.pick).question
        guess = gets.chomp
        round.take_turn(guess)
        puts "_________________________________________________"
    end

    puts "*********** GAME OVER **********"
    puts "You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct}%"
    round.correct_by_category.each_key {|key| puts "#{key} - #{round.percent_correct_by_category(key)}% correct"}
end

start