#Round class

class Round
  attr_reader :deck, :turns

#creates deck object
  def initialize (deck)
#creates attribute known as deck
    @deck = deck
#creates empty array known as turns
    @turns = []
  end

#method to return the first card in the 'deck' attribute
  def current_card
#calls deck class > attribute cards > first card
    deck.cards.first
    #might be a problem when running thru cards.
  end

#takes 'guess' from users and creates a new Turn object with the guess and the first card of the deck array
  def take_turn(guess)
#create new turn object stored as start_turn class
   start_turn = Turn.new(guess, @current_card)
#shovles the new Turn object into the turn array in deck
   @turns << start_turn
   start_turn
    if start_turn.guess == @current_card
        deck.turn.correct?
    end
  end

  #def correct?
    #
  #end

  #def number_correct
    #if deck.card.correct? == true
        #number_correct += 1
    #end


end
