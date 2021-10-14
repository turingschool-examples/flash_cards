require '/turn'

class Round
  attr_reader :deck, :turns#, :round

  #need attributes for: deck, turns, number correct,
  def initialize(deck)
    @deck = deck
    @number_correct = 0
    @turns = []
    # @round = 0
  end

  #need methods for: take_turn, current_card, correct?, number_correct
  def current_card
    if @turns.length == 0
      @deck.cards[0]
    else
      @deck.cards[@turns.length]
    end
  end

  def take_turn(response)
    #need to iterate through the cards/get the card to match current card
    @turn = Turn.new(response, @deck.cards[@turns.length])
    # @round += 1
    @turns << @turn
    @turn
  end
#need to add a loop to check for each turn being true ******
  def number_correct
    @turns.each do |trivia|
      if trivia.correct?  == true
        # require 'pry'; binding.pry
        @number_correct += 1 #this counter is increasing each time number_correct is run
      end
    end
    @number_correct
  end

  def number_correct_by_category(category)

  end
  def percent_correct
    @number_correct/@turns.length
  end
end
