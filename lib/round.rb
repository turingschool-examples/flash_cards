class Round
  attr_accessor :deck,
                :turns,
                :current_card_num,
                :current_card,
                :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card_num = 0
    @current_card = deck.cards[0]
    @number_correct
  end

  def take_turn(guess)
    if @turns != []
      @current_card_num =+ 1
      @current_card = deck.cards[@current_card_num]
    end
    Turn.new(guess, @current_card)
    #when I try to shovel this into @turns, my return value becomes an array
    #how do I keep the return value as is but still add the return value to turns?
  end

end
