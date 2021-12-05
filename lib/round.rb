# require 'pry';
class Round
  attr_reader :round, :turns, :current_card, :deck, :take_turn

  def initialize(deck)
    @round = round
    @deck = deck
    @turns = []
  end


    def current_card
      @deck.cards[0]
    end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
   @turns << new_turn
   @turns.last
   @deck.cards.rotate!
   return new_turn
  end

  def number_correct
    correct_guesses = 0
    @turns.each do |turn|
      if turn.correct?
        correct_guesses += 1
      end
    end
    return correct_guesses
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.card.category == category && turn.correct?
    end
  end

  def percent_correct
    #@turns.count.to_f
    #number_correct.to_f
    (number_correct.to_f / @turns.count.to_f) * 100.0
    #require 'pry'; binding.pry
      # @turns
  end

  def percent_correct_by_category(category)
    @turns.count.to_f
    # percent_correct_by_category(category).to_f
    # (percent_correct_by_category(category) / turns.count) * 100.0
  end
end
# def turns
#
# end
#can be done in take turn class


# @deck = deck



# def current_card
#   @deck.cards.first
# end
# cat_geography = 0
# cat_stem = 0
# p @turns.count


# if turn.card.category == :Geography
#   cat_geography += 1
# elsif turn.card.category = :STEM
#   cat_stem +=1
# else
#   puts "There is no category"
# end
