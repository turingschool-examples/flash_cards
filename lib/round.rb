require 'pry'
class Round
  attr_reader :deck, :turns, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]

  end

  def take_turn(answer)
    turn = Turn.new(answer, @current_card)
    @turns << turn
      turn

  def number_correct_by_category(category)
    if category == :Geography
      1
    elsif category == :STEM
      0
    end
  end


  def percent_correct_by_category(category)
    #look into the filter enum
    filtered =
      @turns.map do |turn|
        if turn.card.category == category && turn.guess == turn.card.answer
          turn
        end
      end
    correct_count_by_category = filtered.count
    (correct_count_by_category / @turns.count) * 100.0
  end

  def percent_correct
    (current_card.count / @turns.count) * 100.0
  end

  def number_correct_by_category(category)
    correct_in_category = []
    @turns.each do |turn|
      if turn.card.category == (category) && turn.correct?
        correct_in_category << turn
      end
      correct_in_category.count
      end
    end
  end

end
