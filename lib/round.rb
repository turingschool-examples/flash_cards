class Round
  attr_accessor :deck, :turns, :cards, :guess, :answer
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    deck.cards.rotate(1)
    #this_turn
  end

  def number_correct
    correct = []
     turns.each do |turn|
      if turn.correct?
        correct << turn
      end
    end
    return correct.length
  end

  def number_correct_by_category(category)
    @turns.find_all do |turn|
      turn.card.category == category && turn.card.answer == turn.guess
    end.size
  end

  def percent_correct
    
  end



end
