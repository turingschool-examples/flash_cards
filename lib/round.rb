class Round
  attr_accessor :deck, :turns, :correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct = {"total_correct" => 0}
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    if(turn.correct?)
      @correct["total_correct"] += 1
      if(@correct.include?(current_card.category))
        @correct[current_card.category] += 1
      else
        @correct[current_card.category] = 1
      end
    else
      @correct[current_card.category] = 0
    end
    @deck.cards.shift
    @turns << turn
    turn
  end

  def number_correct
    @correct.fetch("total_correct")
  end

  def number_correct_by_category(category)
    @correct[category]
  end

  def percent_correct
    (@correct["total_correct"].to_f / @turns.size.to_f) * 100
  end

  def percent_correct_by_category(category)
    #(@correct[category].to_f / @deck.cards.cards_in_category(cards_in_category)) * 100
  end

end
