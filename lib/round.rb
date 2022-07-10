class Round
  attr_reader :deck, :turns, :correct_answers
  def initialize(deck)
     @deck = deck
     @turns = []
     @correct_answers = 0
  end

  def current_card 
    deck.cards.shift
  end

  def take_turn(prediction)
    card = current_card
       turn =  Turn.new(prediction, card)
    if turn.correct? 
      @correct_answers += 1
    end
    @turns << turn
    turn
  end

  def number_correct 
    correct_answers 
  end

  def number_correct_by_category(category)
    correct_by_category = turns.select do |turn|
      turn.correct? && turn.card.category == category
    end
    correct_by_category.count
  end

  def percent_correct 
    pct_crt = (number_correct / turns.count.to_f) * 100
    pct_crt.round(1) 
  end

  def percent_correct_by_category(category)
    turns_by_category = turns.select do |turn|
      turn.card.category == category 
    end
    cat_pct = (number_correct_by_category(category) / turns_by_category.count.to_f) * 100
    cat_pct.round(1) 
  end

  def start
    "Welcome to Tour de Frace Trivia! 
    You're playing with 4 cards.
    ------------------------------------
    This is card number 1 out of 4."
  end
end
