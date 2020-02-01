require './lib/turn'
require './lib/card'
require './lib/deck'

class Round
  attr_reader :deck
  attr_accessor :turns

  def initialize(deck_parameter)
    @deck = deck_parameter
    @turns = []
  end

  def current_card
    @deck.cards[0]
    end

  def take_turn(guess_parameter)
    @guess = guess_parameter
    = Turn.new(@guess, current_card)
  end


  def turns
    deck.cards each do |card|
      @deck << current_card
    end
  end
