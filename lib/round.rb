class Round
  attr_reader :deck, :turns, :guess
  def initialize(deck)
    @deck = deck
    @turns = []
  end

#this method needs to return the first card in the deck and once a guess is made and recorded the next card in the deck becomes the current card
  def current_card
    @deck.cards.first
  end
#the "!" in .rotate! is basically the same as doing this
#current = @deck.cards.rotate
  def get_new_card
  @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.shift
    turn
  end

  def number_correct
    num_correct = 0
    @turns.each do |turn|
      if turn.correct?
        num_correct = num_correct + 1
      end
    end
    num_correct
  end

  def number_correct_by_category(category)
    num_correct = 0.0
    @turns.each do |turn|
      if turn.correct? && turn.card.category == category
        num_correct = num_correct + 1
      end
    end
    num_correct
  end

  def percent_correct
    num_correct = 0.0
    @turns.each do |turn|
      if turn.correct?
        num_correct = num_correct + 1
      end
    end
    (num_correct / @turns.length) * 100
  end

  def total_cards_per_category(category)
    total_cards = turns.find_all do |turn|
      turn.card.category == category
    end
    total_cards
  end

  def percent_correct_by_category(category)
    num_correct = 0.0
    @turns.each do |turn|
      if turn.correct? && (turn.card.category == category)
        num_correct += 1.0
      end
    end

    num_correct
    (num_correct / total_cards_per_category(category).length * 100).round(2)
  end
end

# num_correct
# card_cate = []
# @cards.each do |card|
#   if card.category == card_category
#     card_cate << card

# num_correct_by_category = []
# @turns.each do |turn|
#   require "pry"; binding.pry
#   turn.number_correct = turn.cards_in_category(category)
#   num_correct_by_category << turn
#   end
#   num_correct_by_category.number_correct

# num_correct_by_category = 0
# @deck.each do |card|
#   require "pry"; binding.pry
#   if card.cards_in_category
#
#     num_correct_by_category = num_correct_by_category + 1
#   end
# end
# num_correct_by_category
