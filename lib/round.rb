require './lib/turn'
require 'pry'

class Round
  attr_reader :deck, :turns, :number_correct, :card_index #remove card index later, tech debt :)
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
    @current_turn = Turn.new(guess, @deck[@card_index])
    #refactor to boolean
    increment_pts_if_correct


    @turns << @current_turn

    #display if correct or not
    puts @turns[@turn_index].feedback

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
    binding.pry
    p filtered_array.length
    filtered_array.length
  end

  def percent_correct
    (@number_correct.to_f / @deck.count.to_f).round(2) * 100
  end

  def percent_correct_by_category(choose_category)
    total_category = []
    @deck.each do |deck_element|
        total_category << deck_element.category

    end
    binding.pry
    total_category = total_category.uniq
    number_correct_by_category(choose_category) / total_category
    # #why did this error and make me add at new_num variable
    # new_num = 0
    # @deck.cards_in_category(choose_category)
    #   new_num =  number_correct_by_category(choose_category).to_f / @deck.cards_in_category(choose_category).length
    #   binding.pry
    # new_num * 100
  end




end
