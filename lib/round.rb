class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  # def turns
  #   # this could possibly be a default instance variable
  #   # the default value is an empty array
  # end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    #instantiates and returns a new Turn instance?
    #maybe at the end of the method it also
    #takes the current card and shovels it to
    #the turns array and also removes the current
    #card from the deck?
    @turns.push(turn)
    @deck.cards.shift
    return turn
    #maybe there are 2 default instance variables
    # of empty arrays called 'correct' and incorrect
    # that we shovel to as well? This would help when
    #counting the number of correct
  end

  def number_correct
    #iterate across the turns array and count all correct?'s
    count = 0
    @turns.each do |turn|
      if turn.correct?
        count += 1
      end
    end
    count
  end

  def number_correct_by_category(category)
    count = 0
    @turns.each do |turn|
      if turn.card.category == category && turn.correct?
        count += 1
      end
    end
    count
  end

  def percent_correct
    # May not need 'self.'
    ((self.number_correct * 100.0) / @turns.count).round(1)
  end

  def percent_correct_by_category(category)
    ((number_correct_by_category(category) * 100.0) / cards_in_category(category)).round(1)
    #   NoMethodError: undefined method `cards_in_category' for #<Round:0x0000000130a8d7d0>
    #   from /Users/brantfuller/turing/1module/flash_cards/lib/round.rb:59:in `percent_correct_by_category'
  end
end
