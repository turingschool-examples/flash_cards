class Round
  attr_reader :deck, :turns, :cards, :current_card, :correct_cards, :round

  def initialize(deck)
    @deck = deck
    @turns = []
    @cards = cards
    @round = round
    @current_card = 0
  end

  def current_card
    @deck.cards[@current_card]
  end

 def take_turn(guess)
   new_turn = Turn.new(guess, current_card)
   @turns << new_turn
   @current_card += 1
   return new_turn
 end

 def number_correct
   correct_cards = 0
   turns.each do |turn|
     if turn.correct?
       correct_cards += 1
     end
     correct_cards
  end 
   # if @round.feedback == "Correct"
   #   @correct_cards += 1
   # end
 end

end
