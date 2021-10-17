require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

# Creates setup for flash cards to play with
@card_1 = Card.new("What is 5 + 5?", "10" || "ten" || 10, :STEM)
@card_2 = Card.new("What is Rachel's favorite animal?", "Cat", "Pop Culture")
@card_3 = Card.new("What is Mike's middle name?", "Nobody knows", "Turing Staff")
@card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Turing Staff")
@deck = Deck.new([@card_1, @card_2, @card_3, @card_4])
@round = Round.new(@deck)
@num_stem =@round.deck.cards_in_category(:STEM).size
@num_turing = @round.deck.cards_in_category("Turing Staff").size
@num_pop = @round.deck.cards_in_category("Pop Culture").size

# Start method initiates play / simulates card play / asks for user guesses
def start

puts "Welcome! You're playing with #{@round.deck.cards.count}
-------------------------------------------------"
puts "This is card number #{@round.current_card.to_s.to_i + 1} out of #{@round.deck.cards.count} cards.
Question: #{@round.current_card.question}"
end

def game_play
  until @round.turns.count == @round.deck.cards.count
    guess = $stdin.gets.strip
    @round.take_turn(guess)
    @round.turns.last.feedback
    puts "This is card number #{@round.turns.count + 1}" if @round.turns.count != @round.deck.cards.count
    puts @round.current_card.question.to_s if @round.turns.count != @round.deck.cards.count
  end

  puts "****** Game over! ******"
  game_over =  @round.turns.map do |turn|
     puts "#{turn.card.category} -  #{@round.percent_correct_by_category(turn.card.category)}%"
    end
  if @round.turns.count == @round.deck.cards.count
    game_over
  end

end






start
game_play
