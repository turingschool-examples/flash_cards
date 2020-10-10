
class Round
  attr_reader :deck, :turns, :current_card

  def initialize (deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[@turns.count]
    @correct_cards = []
    @number_correct_by_category_array = []
  end


  def take_turn(guess)
    new_turn = Turn.new(guess, @current_card)
    @turns << new_turn
    new_turn
  end

  def number_correct
      @turns.find_all do |turn|
        if turn.correct?
        @correct_cards << turn
        end
      end
    @correct_cards.count
  end

  def number_correct_by_category(input_category)
    @turns.find_all do |turn|
      if turn.correct?
        @correct_cards << turn
      end
    end
    require 'pry'; binding.pry
    @correct_cards.find_all do |turn|
      if turn.card.category == input_category
        @number_correct_by_category_array << turn
      end
    end
    @number_correct_by_category_array.count
  end
end
