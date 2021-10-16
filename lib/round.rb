require './lib/card'
require './lib/deck'
require './lib/turn'

class Round

  attr_accessor :deck, :turns, :cards, :category

  def initialize(deck)
    # deck will get pulled in - collection of cards
    @deck = deck
    # turns will get added to turns array in take_turn method
    @turns = []
  end

  def take_turn(guess)
    #create new turn (pull in guess, current card)
    this_turn = Turn.new(guess,current_card)
    # add new turn to turns array
    @turns << this_turn
    # move new card to front of deck
    @deck.cards.rotate!(1)

    return this_turn
  end


  def turns
    return @turns
  end


  def number_correct
    correct = []
    turns.each do |turn|
      if turn.correct?
        correct << turn
      end
      #require "pry"; binding.pry
    end
    correct.length
  end

  def number_correct_by_category(category)
    correct_by_category = []

    turns.each do |turn|
      if turn.correct? == true && turn.card.category == category
        correct_by_category << turn
      end

    end
    #require "pry"; binding.pry

    return correct_by_category.length
  end

  def percent_correct
    ((number_correct.to_f/turns.length.to_f)*100).round
    # require "pry"; binding.pry
  end


  def percent_correct_by_category(category)
    counter = 0
    # require "pry"; binding.pry

    turns.each do |turn|
      if turn.card.category == category
        counter = counter + 1
      else

      end
    end


    number_correct_by_category(category)/counter*100


  end


  def current_card # first card, since the cards rotate
    deck.cards[0]
  end


end
