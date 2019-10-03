class Round

  require './lib/turn'
  require './lib/card'
  require './lib/deck'

  attr_accessor :deck, :turns, :count_array

  def initialize(deck)
    @deck = deck
    @turns = []
    @count_array = []
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guesses)
   @turns << Turn.new(guesses, current_card)
   deck.cards.shift
   @count_array << @turns.last.correct?
   @turns.last
  end
  def correct?
      count_array.last
  end

  def number_correct

  end

  def feedback
     self.turn.card.feedback
  end

  def number_correct_by_category(category)
    turns.each do |turn|
        if turn.card.category == category
            @category_count += 1
        end
    end
      category_count
  end

  def percent_correct
  number_correct
   @correct_count.to_f / @turns.count
   #percent = ((100.00 / turns.count.to_f) * correct_count.to_f)
   #format("%.2f", percent)
  end

  def percent_correct_by_category(category)

  end

end
