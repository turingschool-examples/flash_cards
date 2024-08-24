require 'pry'

class Round
  attr_reader :deck, :turns, :current_card
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards[0]
    @index = 0
    #binding.pry
  end

  def take_turn(guess, card = @current_card)
    turn = Turn.new(guess, card)
    @turns << turn
    @index += 1
    @current_card = deck.cards[@index]
    turn
  end
  
  def number_correct
    correct_answers = turns.find_all do |turn|
    turn.correct? == true
    end
    correct_answers.length
  end


end