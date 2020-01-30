require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


@card1 = Card.new("Who is the current President of the United States?", "Donald Trump", :History)
@card2 = Card.new("How many professional major golf championships has Tiger Woods won?", "18... tied with Jack Nicklaus... Tiger has also won 82 PGA Tour events", :Sports)
@card3 = Card.new("How many cards are in a playing deck?", "52", :Entertainment)

@cards = [@card1, @card2, @card3]
@deck = Deck.new(@cards)
@round = Round.new(@deck)

def start
  puts "Welcome! You are playing with #{@cards.count} cards." + "\n\n"
  puts "-------------GOOD LUCK----------------" + "\n\n"
  puts "This is card number #{@cards.find_index(@round.current_card) + 1} out of #{@cards.count}"
  puts @round.current_card.question

  @round.take_turn(gets.chomp)


end




puts start
