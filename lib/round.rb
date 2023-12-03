require './lib/turn'

class Round
  attr_reader :deck,
              :turns,
              :current_card_idx
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card_idx = 0
    @correct_guess = []
    @correct_categories = {}
  end

  def current_card
    deck.collection_card[@current_card_idx]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn

    if turn.correct?
      @correct_guess << turn
      if @correct_categories.key?(current_card.category)
        @correct_categories[current_card.category] += 1
      else
        @correct_categories[current_card.category] = 1
      end
    end
    @current_card_idx += 1
    turn
  end

  def number_correct
    @correct_guess.count
  end

  def number_correct_by_category(category)
    if @correct_categories.key?(category)
      @correct_categories[category]
    else
      0
    end
  end

  def percent_correct
    percent_correct =(number_correct.to_f / @turns.count.to_f ) * 100
    percent_correct.round(2)
  end

  def percent_correct_by_category(category)
    percent_correct_by_category = (number_correct_by_category(category).to_f / number_correct.to_f ) * 100
    percent_correct_by_category.round(2)
  end
end
