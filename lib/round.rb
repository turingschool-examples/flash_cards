require './lib/turn'

class Round
attr_reader :deck, :turns, :card_tracker, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @card_tracker = 0
    @number_correct = 0
  end

  def current_card
    deck.cards[card_tracker]
  end

  def take_turn(guess)
    turn = Turn.new(guess, deck.cards[card_tracker])
   @turns << turn
   @card_tracker += 1
   @number_correct += 1 if turn.correct? == true

   turn
  end

  def number_correct_by_category(user_cat)
    count = 0
    
    turns.each do |turn|
      count += 1 if turn.card.category == user_cat && turn.correct? 
    end
    count
  end
  
end