class Round
require './lib/turn'

  attr_accessor :deck, :turns, :count_array,
  :category_count, :new_turn, :guesses, :stem, :geography

  def initialize(deck)
    @deck = deck
    @turns = []
    @new_turn
    @count_array = []
    @guesses
    @stem
    @geography
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guesses)
   @new_turn = Turn.new(guesses, current_card)
   @turns << @new_turn
   deck.cards.rotate!
   if @new_turn.correct?
     @count_array << @new_turn
   end
   @turns.last
  end

  def number_correct
    @count_array.size
  end

  def number_correct_by_category(category)
    @category_count = []
    @category_count =  @turns.find_all do |turn|
         turn.correct? && turn.card.category == category
    end
    @category_count.size
  end

  def percent_correct
   percent = ((100.00 / @turns.size) * @count_array.size)
   format("%.2f", percent)
  end

  def percent_correct_by_category(category)
      @deck.cards_in_category(category)
      number_correct_by_category(category)
      percent_by_category = ((100.00 / @deck.category_array.size) * number_correct_by_category(category))
      format("%.2f", percent_by_category)
  end

end
