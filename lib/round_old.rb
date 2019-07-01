#Round class

class Round
  attr_reader :deck, :turns

#creates deck object
  def initialize (deck)
    @deck = deck
    #@turns = []
  end

  def current_card
    deck.cards.first
  end


  #def take_turn(guess)
   #start_turn = Turn.new(guess, @current_card)
   #@turns << start_turn
   #start_turn
    #if start_turn.guess == @current_card
        #deck.turn.correct?
    #end
  #end

  #def correct?
    #
  #end

  #def number_correct
    #if deck.card.correct? == true
        #number_correct += 1
    #end


end
