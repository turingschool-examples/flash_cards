class Round
require './lib/turn'

  attr_accessor :deck, :turns, :count_array, :false_count, :correct_count,
  :category_count, :percent, :new_turn
  def initialize(deck)
    @deck = deck
    @turns = []
    @new_turn
    @count_array = []
    @false_count = 0
    @correct_count = 0
    @category_count = 0
    @percent
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guesses)
   @new_turn = Turn.new(guesses, current_card)
   @turns << @new_turn
   deck.cards.shift
   @count_array << @new_turn.correct?
   @turns.last
  end

  def number_correct
    @count_array.size
  end

  def number_correct_by_category(category)
    @turns.each do |turn|
        if turn.card.category == category
            @category_count += 1
        end
    end
      @category_count
  end

  def percent_correct
  number_correct
   percent = ((100.00 / turns.count.to_f) * correct_count.to_f)
   format("%.2f", percent)
  end

  def percent_correct_by_category(category)

  end

end
