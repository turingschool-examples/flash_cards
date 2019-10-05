require './lib/turn'
require 'pry'

class Round
  attr_reader :deck, :turns, :number_correct
  def initialize(deck)
    @deck = deck
    @number_correct = 0
    @card_index = 0
    @turn_index = 0
    @turns = []
    @winning_category_array = []
    # start #call the welcome screen
  end

  def take_turn(guess)
    @current_turn = Turn.new(guess, @deck.cards[@card_index])
    #refactor to boolean

    increment_pts_if_correct


    @turns << @current_turn
    @turns[@turn_index].feedback

    @turn_index += 1
    @card_index += 1

    @current_turn #return the current turn

  end

  def increment_pts_if_correct
    if @current_turn.correct?
      @number_correct += 1
      # add the category
      @current_category = @current_turn.card.category
      @winning_category_array << @current_category

    end

  def number_correct_by_category(choose_category)
    # @chose_category = choose_category

    filtered_array =[]
    binding.pry
    @winning_category_array.each do |element|
      if element == choose_category
        filtered_array << element
        # binding.pry

      end
    end
    p filtered_array.length
    filtered_array.length
  end

  end

  # def start
  #   p "Welcome! You're playing with #{deck.cards} cards."
  # end
end
