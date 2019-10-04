class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.delete_at(0)
    new_turn
  end

  def current_card
    @deck.cards.first
  end

  def number_correct
    sum = 0
    @turns.each do |turn|
      sum += 1 if turn.correct?
    end
    sum
  end

  def number_correct_by_category(category)
    sum = 0
    @turns.each do |turn|
      if turn.card.category == category
        sum += 1 if turn.correct?
      end
    end
    sum
  end

  def percent_correct
    ((number_correct.to_f / @turns.count.to_f)*100).to_i
  end

end
