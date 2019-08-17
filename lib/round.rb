
class Round
  attr_accessor :deck,
                :current_card,
                :turns,
                :correct_turns,
                :correct_by_category

  def initialize(deck)
    @deck = deck
    @current_card = deck.cards[0]
    @turns = []
    @correct_turns = []
    @correct_by_category = []
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift
    @current_card = deck.cards[0]
    new_turn
  end

  def number_correct
    @turns.find_all do |turn|
      if turn.correct? == true
        @correct_turns << turn
      end
    end
    @correct_turns.count
  end

  def number_correct_by_category(category)
    @turns.find_all do |turn|
      if turn.correct? == true && turn.card.category == category
        @correct_by_category << turn
      end
    end
    @correct_by_category.count
  end

  def percent_correct
    @turns.find_all do |turn|
      if turn.correct? == true
        @correct_turns << turn
      end
    end
    (@correct_turns.count.to_f / @turns.count) * 100
  end

  def percent_correct_by_category(category)
    @turns.find_all do |turn|
      if turn.correct? == true && turn.card.category == category
        @correct_by_category << turn
      end
    end
    arr = @turns.find_all do |turn|
      turn.card.category == category
    end
    (@correct_by_category.count.to_f / arr.count) * 100
  end

end
