class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = 0
  end

  def current_card
    @deck.cards[@current_card]
  end

  def take_turn(guess)
     record_turn = Turn.new(guess, current_card)
     @turns << record_turn
     deck.cards.shift
     record_turn
  end

  def number_correct
    num_correct = 0
    @turns.each do |turn|
      if turn.correct?
        num_correct += 1
      end
    end
    num_correct
  end

  def number_correct_by_category(category)
    @turns.count{|turn| turn.card.category == category && turn.correct?}
  end

  def percentage_correct
    (@turns.count.to_f / number_correct) * 100
  end

  def percentage_correct_by_category(category)
    (@turns.count.to_f / number_correct_by_category(category)) * 100
  end

end
