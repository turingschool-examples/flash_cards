class Round
    attr_reader :deck, :turn, :number_correct, :current_card
    def initialize(deck)
        @deck = deck
        @turn = []
        @number_correct = 0
        @card_counter = 0
        @current_card = @deck.cards[@card_counter]
    end
    
    def take_turn(guess)
        @number_correct += 1  if guess == @current_card.answer
        @card_counter += 1
        @turn = Turn.new(guess, @current_card)
    end

    def turns 
        @turn
    end

end