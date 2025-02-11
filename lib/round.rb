class Round
    # initialized deck, turns and current_card
    attr_reader :deck, :turns, :current_card
    def initialize(deck)
        @deck = deck
        @turns = []
        @cards= 0
    end
    def take_turn(guess) # this is creating the take_turn method and is taking the argument guess from the Card
        # current_card is returning the current card in the deck
        # making a new turn instance that gets stored in @turns and moves to the next turn
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        next_card
        new_turn
    end
    def display_card # made a method to display the card with a puts statement. 
        # it's calling the current_card and using the .question method on it to show the text of the question.
        puts "Current Card: #{current_card.question}"
    end
    def current_card
        @deck.cards[@cards]  # get the current card by its index place starts at 0
    end
    # this is supposed to get the next card, it's not quite working how I want it to
    def next_card
        # 
        @cards += 1
    end
end