require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :current_card, :deck, :turns
  attr_accessor :guess, :correct_answers, :add
  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_answers = []
    @add = []
  end
  def correct?
    @correct
  end
  def current_card
    @deck.cards[0]
  end
  def take_turn(guess)
    @guess = guess
    add << current_card
    if @deck.cards[0].answer == @guess
      @correct_answers << @deck.cards[0]
    end
    deck.cards.delete_at(0)
    turn = Turn.new(@guess, add.last)
    @turns << turn
    turn
  end
  def number_correct
      @correct_answers.count
  end
  def number_correct_by_category(topic)
    @correct_answers.select{ |card| card.category == topic  }.length
  end
  def percent_correct
    100 * number_correct / turns.length.to_f
  end
  def percent_correct_by_category(topic)
    100 *  number_correct_by_category(topic).to_f / add.select{ |card| card.category == topic }.length
  end


end
