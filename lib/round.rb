#~/round.rb
class Round
  attr_reader :deck, :turns, :count, :correct_tally

  def initialize(deck)
    @deck = deck
    @turns = []
    @count = 1
    @correct_tally = 0
  end

  def current_card
    @deck.cards[@count - 1]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    number_correct
    @count += 1
    @turns.last
  end

  def number_correct
    if @turns.last.correct? == true
      @correct_tally += 1
    end
  end

  def number_correct_by_category(target_category)
    correct_by_category_tally = 0
    @turns.each do |turn|
      if turn.card.category == target_category && turn.correct?
        correct_by_category_tally += 1
      end
    end
    correct_by_category_tally
  end

  def percent_correct
    correct = 0.0
    @turns.each do |turn|
      if turn.correct?
        correct += 1
      end
    end
    correct / @turns.length * 100
  end

  def percent_correct_by_category(target_category)
    correct = 0.0
    total = 0.0
    @turns.each do |turn|
      if turn.card.category == target_category && turn.correct?
        correct += 1
        total += 1
      elsif turn.card.category == target_category
        total += 1
      end
    end
    correct / total * 100
  end
end
