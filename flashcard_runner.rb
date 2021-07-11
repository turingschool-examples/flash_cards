require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

class FlashCardRun
#
  def initialize(round)
    @round = round
    @deck = round.deck
    @current_question = round.current_card.question
  end

#running the game
  def start(round)
    welcome

    round.deck.cards.each do |card|
      turn_message(round)
      get_guess(round)
      puts round.number_correct
    end

    game_over(round)
  end

#welcome message
  def welcome
    puts "Welcome! You're playing with #{@deck.count} cards."
    puts "-------------------------------------------------"
  end

#turn message - card x of 4, question
  def turn_message(round)
    puts "This is card number #{round.turns.length + 1} of #{@deck.count + round.turns.length}."
    puts "Question: #{round.current_card.question}?"
  end


#where i get user input for each guess
  def get_guess(round)
    new_guess = gets.chomp
    round.take_turn(new_guess)
  end

#final message when all cards are used
  def game_over(round)
    puts "****** Game over! ******"
    puts "You had #{round.number_correct} correct guesses out of #{@deck.count} for a total score of #{round.percent_correct}%!"
  end
end



#information needed for game!
card_1 = Card.new("Who has the most career points in the NHL", "Wayne Gretzky", :Sports)
card_2 = Card.new("Who won the UEFA Champions League in 2021", "Chelsea", :Sports)
card_3 = Card.new("How many movies are there in the Harry Potter series?", "8", :Entertainment)
card_4 = Card.new("What year did The Lord of the Rings: The Fellowship of the Ring release?", "2001", :Entertainment)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
first_round = Round.new(deck)
new_game = FlashCardRun.new(first_round)
new_game.start(first_round)
