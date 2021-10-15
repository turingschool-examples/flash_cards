class Round
  attr_accessor :deck, :turns

  def initialize(deck) # deck = collection of card OBJECTS (that each contain strings/category)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, @deck.cards[0])
    @turns << turn
    @deck.cards.shift()
    return turn
  end

  def class
    current_card.class
  end

  def number_correct
    count = 0
    @turns.each do |turn|
      # require 'pry'; binding.pry
      if turn.correct?
        count += 1
      end
    end
    return count

  end

  def number_correct_by_category(category)
    count = 0
    @turns.each do |turn|
      if turn.category == category  # @dmeskis rspec gives an error that there is an
                                    # undefined method 'category'.  I have also
                                    # tried 'turn.card.category' with the same
                                    # message.  I just need to compare the category
                                    # parameter with the actual categories of the
                                    # turns already taken.
        if turn.correct?
          count += 1
        end
      end
    end
    return count
  end

  def percent_correct # can't test until number_correct resolved
    # num = number_correct_by_category / @turns.cards.size
    # num *= 100
  end

  def percent_correct_by_category(category) # can't test until number_correct resolved
    # TODO - need to solve number_correct first
  end

end
