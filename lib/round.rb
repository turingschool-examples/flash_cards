class Round
  attr_reader :deck, :turns, :current_card, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards.first
    @number_correct = 0
  end

  def take_turn(guess)
    turn = Turn.new(guess, @current_card)
    @turns << turn
    @deck.cards.rotate!
    @current_card = @deck.cards.first
    if @turns.last.correct?
      @number_correct += 1
    end
    turn
  end

  def number_correct_by_category(category)
    num_cor = 0
    @turns.each do |turn|
      if turn.card.category == category && turn.card.answer == turn.guess
          num_cor += 1
      end
    end
    num_cor
  end

  def percent_correct
    (@number_correct / @turns.count.to_f * 100).round(1)
  end

  def percent_correct_by_category(category)
    num_in_cat = 0
    @turns.each do |turn|
      if turn.card.category == category
        num_in_cat += 1
      end
    end
    (number_correct_by_category(category) / num_in_cat.to_f * 100).round(1)
  end

end
