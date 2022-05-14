class Round

  attr_reader :deck , :turns , :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @turn_count = 0


  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)

    turn = Turn.new(guess, current_card)
    turns << turn
    if turn.correct?
      @number_correct += 1
    end
    deck.cards.rotate!
    return turn
    # turn
  end



  # def number_correct
  #     if turns.correct?
  #       @number_correct += 1
  #     end
  #     return @number_correct
  # end



  def number_correct_by_category(category)
    number_correct_by_category = 0

    @turns.each do |turn|
      if turn.card.category == category && turn.correct?
        number_correct_by_category += 1
      end
    end
  end



  def start
  end

end
