require 'pry'
class Round
  attr_reader :deck, :turns, :cur_card_index

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @num_correct_cat = [:Geography, :STEM, :Pop_Culture]
    @cat_score = [0, 0, 0]
  end

  def current_card
    @deck.cards[0]
  end


  def number_correct
    @number_correct
  end

  def number_correct_by_category(category)
    @cat_score[@num_correct_cat.index(category)]
  end

  def percent_correct
    (@number_correct.to_f / @turns.length.to_f * 100).round(1)
  end

  def percent_correct_category(category)
    corr_category = 0
    corr_category = @turns.find_all do |turn|
      turn.card.category == category
      end.length
      (number_correct_by_category(category) / corr_category.to_f * 100).round(1)
  end



  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    if @turns.last.correct?
      @number_correct += 1
      @cat_score[@num_correct_cat.index(current_card.category)] += 1
    end
      @deck = Deck.new(@deck.cards.rotate(1))
      @turns.last
  end
end

        #binding.pry
