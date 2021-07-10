require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

class FlashCardRun

  def initialize(round)
    @round = round
    @deck = round.deck
    @current_card = round.current_card_index
    @current_question = round.current_card.question
  end

  def start
    puts "Welcome! You're playing with #{@deck.count} cards."
    puts "-------------------------------------------------"
    card_number_to_deck_count
    current_question_to_ask
    get_guess
  end

  def card_number_to_deck_count
    puts "This is card number #{@current_card} of #{@deck.count}" #CURRENT CARD NOT WORKING
  end

  def current_question_to_ask
    puts "Question: #{@current_question}?"
  end

  def get_guess
    @round.deck.card.each do |question|
      card_number_to_deck_count
      current_question_to_ask
    end
    new_guess = gets.chomp
    first_round.take_turn(new_guess)
    puts first_round.number_correct
  end
end

card_1 = Card.new("Who has the most career points in the NHL", "Wayne Gretzky", :Sports)
card_2 = Card.new("Who won the UEFA Champions League in 2021", "Chelsea FC", :Sports)
card_3 = Card.new("How many movies are there in the Harry Potter series?", 8, :Entertainment)
card_4 = Card.new("What year did The Lord of the Rings: The Fellowship of the Ring release?", 2001, :Entertainment)
deck = Deck.new([card_1, card_2, card_3, card_4])
first_round = Round.new(deck)
new_game = FlashCardRun.new(first_round).start

new_guess = gets.chomp
first_round.take_turn(new_guess)
puts first_round.number_correct


# game.rest_of_the_rounds
#Repeat steps above for remaining cards until turns.length == deck.cards.length

#When finished:
#puts *******GAME OVER********
#puts You had (amount of correct guesses) out of deck.cards.length for a total score of percent_correct
#category1 - percent correct by category
#category2 - percent correct by category
#category3- percent correct by category
