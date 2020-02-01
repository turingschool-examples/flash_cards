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
  @deck.cards.rotate!
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    get_new_card
    @turns << turn
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
    num_correct = 0
    @turns.each do |turn|
      if turn.correct? && turn.card.category == category
        num_correct = num_correct + 1
      end
    end
    num_correct
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
