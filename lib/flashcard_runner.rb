require './lib/card'
require './lib/deck'
require './lib/round'

@card_1 = Card.new("What is capital of Colorado?", "Denver", :Geography)
@card_2 = Card.new("Why do we have test tubes", "because", :STEM)
@card_3 = Card.new("Why do we run", "lose weight", :STEM)

@cards = [@card_1, @card_2, @card_3]

@deck = Deck.new(@cards)

@round = Round.new(@cards)


def start

  puts "Welcome! You're playing with #{@deck.cards.length} cards"
  puts "______________________________________________"

  while @round.card_index < @deck.cards.length
    puts "This is card number #{@round.card_index + 1} out of #{@deck.cards.length}" #card_index messed up

    puts "Question: #{@deck.cards[@round.card_index].question}"

    user_guess = gets.chomp

    @round.take_turn(user_guess)

    puts ''
    end

    # Game over
    puts "You had #{@round.number_correct} correct guesses out of #{@deck.cards.length} for a total score of #{@round.percent_correct}%"

    puts "***the breakdown ***"
    #puts "number correct by #{@round.number_correct_by_category(:STEM)}"

end

start
