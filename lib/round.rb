require './lib/card'
require './lib/turn'
require './lib/deck'
require 'pry'

class Round
  attr_reader :deck,
              :turns,
              :current_card,
              :number_correct,
              :total_category,
              :category_correct,
              :record_guess

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
    @number_correct = 0
    @category_correct = Hash.new(0)
    @total_category = Hash.new(0)
    @record_guess = 0
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @current_card)
    @turns << new_turn
    calculate_turns_correct(new_turn)
    calculate_total_turns(new_turn)
    calculate_total_cards_by_category(@current_card.category)
    calculate_category_correct(new_turn, @current_card.category)
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

  def calculate_category_correct(turn, my_category)
    if turn.correct? == true
      @category_correct[my_category] += 1
    else
      @category_correct[my_category] = 0
    end
  end

  def number_correct_by_category(my_category)
    @category_correct[my_category]
  end


  def calculate_total_cards_by_category(my_category)
    @total_category[my_category] += 1
  end

  def calculate_total_turns(turn)
    if turn
      @record_guess += 1
    end
  end

  def percent_correct
    @number_correct / @record_guess
  end

  # def percent_correct_by_category_geography
  #
  # end
  # binding.pry
end
