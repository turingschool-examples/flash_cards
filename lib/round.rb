require './lib/turn'
require './lib/deck'
require './lib/card'

class Round

  attr_reader :deck, :turns, :correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @correct = 0
    @current_card = 0
  end

  def current_card
    deck.cards[@current_card]
  end

#take_turn needs to create a new turn, meaning we need to give it the information needed to create a turn a "guess" and a card.
  def take_turn(guess)
    @new_turn = Turn.new(guess, current_card)
    @turns << @new_turn
    if @new_turn.correct?
      @correct += 1
    end
    @current_card += 1
        @new_turn
  end

  def number_correct
    @correct
  end

  def number_correct_by_category(category)
    turns.count do |turn| #use count instead of each, each returns the whole card
      if turn.card.category == category && turn.correct? == true
        turn.card.category
      end
    end
  end

  def percent_correct
    @correct.to_f / @turns.count * 100
  end

  def unique_categories
    deck.cards.map do |select_category|
      select_category.category
    end
  end

  def new_sorting_method
    new_deck = deck.sort_by { |card| [card.category]}
  end


  def unique_category_singular
    unique_categories.uniq
  end

#redo, this isnt working in the runner for some reason
  def percent_correct_by_category(category)
    total_correct_in_category = 0
    @turns.count do |card|
      if category == card.card.category
        total_correct_in_category += 1
      end
    end
    number_correct_by_category(category).to_f / total_correct_in_category * 100
  end
end
