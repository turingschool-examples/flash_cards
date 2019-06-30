class Round
  attr_reader :deck,:turns
  def initialize(deck)
    @deck = deck
    @turns = []

  end

def current_card
@deck.cards[0]
end

def take_turn(guess) #takes the turn
current_card = @deck.cards[0]
new_turn = Turn.new(guess, @deck.cards[0])
@turns << new_turn
@deck.cards.rotate
current_card = @deck.cards[0]
new_turn
end

def amount_correct #aggregates the amnount correct
  number_correct = 0
  @turns.each do |turn|
    if turn.correct?
      number_correct += 1
    end
  end
  number_correct
end

def number_correct_by_category(category)
    number_correct_category = 0
    @turns.each do |turn|
      if turn.correct? && turn.card.category == category
       number_correct_category += 1
      end
    end
    return number_correct_category
  end

  def percent_correct
      (number_correct.to_f  / @turns.count) * 100
    end

    def percent_correct_category(category)
      @round.number_correct_by_category(category) / @turns.count {|turn|
        turn.card.category == category}.to_f * 100
    end


end #end class
