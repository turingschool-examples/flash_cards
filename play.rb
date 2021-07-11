require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Play
  attr_reader :card_1, :card_2, :card_3, :card_4, :deck, :round

  def initialize
    @card_1 = Card.new("What is the largest state in the US by landmass?", "alaska", :Geography)
    @card_2 = Card.new("What planet is second closest to the sun?", "venus", :Astronomy)
    @card_3 = Card.new("What band did George Harrison play for?", "the beatles", :Music)
    @card_4 = Card.new("What band wrote the Dark Side Of The Moon album?", "pink floyd", :Music)
    @deck = Deck.new([card_1, card_2, card_3, card_4])
    @round = Round.new(deck)
  end

  def start
    puts welcome_message
    puts dashes
    puts card_number
    puts question
    player_input
    puts feedback
  end

  def welcome_message
    "Welcome to Flashcards! You're playing with #{deck.count} cards."
  end

  def dashes
    "-" * 60
  end

  def card_number
    "This is card number #{round.number_card} out of #{deck.count}"
  end

  def question
    "Question: " + "#{round.current_card.question}"
  end

  def player_input
    gets.downcase.chomp
  end

  def feedback
    if player_input == round.current_card.answer
      "Correct!"
    elsif
      player_input == "q"
      "Quitting..."
    else
      "Incorrect."
    end
  end

end

play = Play.new
play.start
