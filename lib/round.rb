
class Round

  attr_reader :deck, :turns, :current_card, :number_correct, :number_wrong, :start
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @number_wrong = 0
  end


  def take_turn(guess)
      turn = Turn.new(guess, deck.cards.shift)
      @turns << turn
      turn.correct? ? @number_correct += 1 : @number_wrong += 1
    return turn
  end

  def current_card
    deck.cards.first
  end

  def number_correct_by_category(category)
    correct_category = []
    @turns.each do |turn|
      if turn.card.category == category && turn.correct?
        correct_category << turn
      end
    end
    return correct_category.count
  end

  def percent_correct
    number_correct == 0 ? 0 : (number_correct.to_f / turns.count) * 100
  end

  def percent_correct_by_category(cat)
    if number_correct_by_category(cat) == 0
      0
    else
      (number_correct_by_category(cat).to_f / (turns.count{|turn| turn.card.category == cat})) * 100
    end
  end
end


  # number_correct_by_category(cat) == 0 ? 0 : 100 % (deck.cards_in_category(cat).count / number_correct_by_category(cat)).to_f
  # (number_correct_by_category(cat).to_f/@turns.count{|turn|turn.card.category == cat})*100.to_i
