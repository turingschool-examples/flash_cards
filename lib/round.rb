
class Round 
  attr_reader :current_card, :turns, :deck, :count, :number_correct

  def initialize(deck)
    @deck = deck
    @current_card_index = 0
    @current_card = deck.cards[@current_card_index]
    @turns = []
    @number_correct = 0
  end

  def take_turn(guess)
    @turn = Turn.new(guess, @current_card)
    @turns << @turn
    @current_card_index += 1
    @current_card = deck.cards[@current_card_index] if @current_card_index < deck.cards.length
    if @turn.correct? == true 
      @number_correct += 1
    end 
    @turn
  end 

  #  I think this is an area I could modify the deck class and use the method i have there to calculate the category cards in turns 
  def number_correct_by_category(category)
    num_in_category = @turns.select {|turn| turn.card.category == category && turn.correct == true}.count

  end  

end 

class Turn 
  attr_reader :guess, :card, :correct

  def initialize(guess, card)
    @card = card
    @guess = guess
    @correct = correct?
  end  

  def correct?
    if @guess == @card.answer
      true
    else 
      false
    end 
  end

  def feedback
    if @guess == @card.answer
      "Correct!"
    else 
      "Incorrect"
    end
  end

end 