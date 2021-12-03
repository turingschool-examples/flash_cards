require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

# CREATE CARDS FOR GAME
card_1 = Card.new("What sport is dubbed the 'king of sports'?", "Soccer", :Sports)
card_2 = Card.new("Area 51 is located in which state?", "Nevada", :Geography)
card_3 = Card.new("What is the national animal of Scotland?", "Unicorn", :Fun_Facts)
card_4 = Card.new("Dump, floater, and wipe are terms used in which team sport?", "Volleyball", :Sports)
card_5 = Card.new("Which country borders 14 nations and crosses 8 time zones?", "Russia", :Geography)
card_6 = Card.new("Iceland diverted roads to avoid disturbing communities of what?", "Elves", :Fun_Facts)
card_7 = Card.new("What does a 'Geiger Counter' measure?", "Radiation", :STEM)
card_8 = Card.new("True or false – lightning is hotter than the sun.", "True", :STEM)

# PUT CARDS IN DECK
cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8]
deck = Deck.new(cards)
round = Round.new(deck)

# GAME CLASS WILL ALLOW USERS TO PLAY TRIVIA
class Game
  attr_reader :round, :starting_deck

  def initialize(round)
    @round = round
    @starting_deck = round.deck.cards.size
  end

  def next_card
    p "This is card number #{round.turns.count + 1} out of #{@starting_deck}"
    p "Question: #{round.current_card.question}"
    get_response
  end

  def get_response
    guess = gets.chomp
    turn = Turn.new(guess, round.current_card)
    round.take_turn(guess)
    p turn.feedback
  end

  def game_over
    p "****** Game over! ******"
    p "You had #{round.correct_guesses.count} correct guesses out of #{@starting_deck} for a total score of #{round.percent_correct}%."
    p "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
    p "Sports - #{round.percent_correct_by_category(:Sports)}% correct"
    p "Geography - #{round.percent_correct_by_category(:Geography)}% correct"
    p "Fun Facts - #{round.percent_correct_by_category(:Fun_Facts)}% correct"
  end

  def start
    p "Welcome! You're playing with #{@starting_deck} cards."
    p "-------------------------------------------------"
    until @starting_deck == round.turns.count
      round.deck.cards.shuffle!
      next_card
    end
    game_over
  end
end

# START THE GAME
game = Game.new(round)
game.start
