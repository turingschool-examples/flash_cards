
class Round

  attr_reader :deck, :turns, :current_card, :number_correct, :number_wrong
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards[0]
    @number_correct = 0
    @number_wrong = 0
  end


  def take_turn(guess)
      turn = Turn.new(guess, current_card)
      @turns << turn
      turn.correct? ? @number_correct += 1 : @number_wrong += 1
      @current_card = deck.cards[+1]
    return turn
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
    100 / turns.count / number_correct 
  end

end
