
class Round
  attr_reader :deck, :turns, :number_correct
#Initializes the round object and passes an arguement deck.
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0


  end


  def current_card

   deck.cards.first

  end

  def take_turn(guess)

    turn = Turn.new(guess, current_card)
      @turns << turn
      if guess == current_card.answer
        @number_correct += 1
      end
      deck.cards.rotate!
      #may require tinkering in iteration_3
      return turn

  end
  # deck.cards.rotate!
  #   #turn

    # turn = Turn.new(guess, current_card)

    # new_turn = round.take_turn("Juneau")

end
