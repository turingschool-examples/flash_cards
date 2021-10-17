require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

@card_1 = Card.new("What is 5 + 5?", "10", :STEM)
@card_2 = Card.new("What is Rachel's favorite animal?", "lion", "Turing Staff")
@card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
@card_4 = Card.new("What cardboard cutout lives at Turing?", "justin bieber", "Pop Culture")

@cards = [@card_1, @card_2, @card_3, @card_4]
@deck = Deck.new(@cards)
@round = Round.new(@deck)

# @turn = Turn.new(guess, @card_1)
@round.start
# until @turns == @cards
guess = gets.chomp
@turn = Turn.new(guess, @round.deck.cards.first)
@turn.correct?
puts @turn.feedback
@round.take_turn(guess)

@round.turns.count

@round.playing
guess = gets.chomp
@turn = Turn.new(guess, @round.deck.cards.first)
@turn.correct?
puts @turn.feedback
@round.take_turn(guess)
require "pry"; binding.pry
# @round.current_card

# end