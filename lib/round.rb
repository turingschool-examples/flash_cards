require './lib/card'
require './lib/turn'
require './lib/deck'
require 'pry'

class Round
  attr_reader :deck, :turns, :current_card, :number_correct, :total_category
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
    @number_correct = 0
    @category_correct = {}
    @total_category = Hash.new(0)
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @current_card)
    @turns << new_turn
    calculate_turns_correct(new_turn)
    calculate_total_cards_by_category(@current_card.category)
    # register_category_correct(@current_card.category)
    set_next_card
    new_turn
  end

  def set_next_card
    @deck.cards.shift
    @current_card = @deck.cards[0]
  end

  def calculate_turns_correct(turn)
    if turn.correct? == true
      @number_correct += 1
    end
  end

  # def register_category_correct(my_category)
  #   @category_correct[my_category]
  # end


  def calculate_total_cards_by_category(my_category)
    @total_category[my_category]+= 1
    # binding.pry
  end

end
