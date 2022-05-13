class Round
  attr_reader :deck, :turns



  def initialize(deck)
    @deck = deck
    @turns = []

  end



  def current_card
    return deck.cards[turns.count]

  end

#I apologize for the huge spaces, it makes it easier for me to separate them visually

  def take_turn(guess)
      turn = Turn.new(guess, current_card)
      @turns << turn

      return turn

  end



  def number_correct
    correct = 0
    @turns.each do |turn|
      if turn.correct?
        correct += 1
      end

    end

    return correct
  end


  def number_correct_by_category(category)
    correct = 0
    @turns.each do |turn|
      if turn.correct? && turn.card.category == category
        correct += 1

      end

    end


    return correct
  end


  def percent_correct
    number_correct = 0

    @turns.each do |turn|
     if turn.guess == turn.card.answer
       number_correct += 1
     end
   end
   percent_correct = (number_correct.to_f / @turns.count.to_f) * 100
   return percent_correct

  end


  def percent_correct_by_category(category)
    return number_correct_by_category(category) * 100.0 / @deck.cards_in_category(category).length


  end

end
