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
  end

  def number_correct_by_category(choose_category)
    # @chose_category = choose_category

    filtered_array =[]
    @winning_category_array.each do |element|
      if element == choose_category
        filtered_array << element
      end
    end
    p filtered_array.length
    filtered_array.length
  end

  def percent_correct
    (@number_correct.to_f / @deck.cards.length.to_f).round(2) * 100
    # binding.pry
  end

  def percent_correct_by_category(choose_category)
    #why did this error and make me add at new_num variable
    new_num = 0
    new_num =  number_correct_by_category(choose_category).to_f / @deck.cards_in_category(choose_category).length.to_f

    new_num * 100
  end

end

  # def start
  #   p "Welcome! You're playing with #{deck.cards} cards."
  # end
