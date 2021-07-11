
class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end


  def current_card
    @deck.cards.first
  end


  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift
    new_turn
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
    num_correct_category = 0
    @turns.each do |turn|
      if turn.correct? && turn.card.category == category
        num_correct_category += 1
      end
    end
    num_correct_category
  end

  def percent_correct
    number_correct.fdiv(turns.length)*100
  end


  def total_number_by_category(category)
    total_category_amount = 0
    @turns.each do |turn|
      if turn.card.category == category
        total_category_amount += 1
      end
    end
    total_category_amount
  end


  def percent_correct_by_category(category)
    number_correct_by_category(category).fdiv(total_number_by_category(category))*100
  end
end
