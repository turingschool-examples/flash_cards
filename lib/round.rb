class Round
    attr_reader :deck, :turns, :current_card, :take_turn
    def initialize(deck)
        @deck = deck
        @turns = turns
        @current_card = current_card
        @take_turn = take_turn
    end
    def current_card
        #the first card in the deck
        #displays next card in deck after etc etc...
    end
    def take_turn(guess)
        #takes a string representing the guess
        #records appropriate guess and card to 'turns' method
        #round should move onto next card in the deck
    end
    def turns
        #this is a list of all the turns taken this round. They are added into an array after the turn is taken
    end
    def correct?
        #checks if guess matches answer
    end
    def number_correct
        #counts num of correct answers
    end
    def number_correct
        #how many were correct
    end
    def number_correct_by_category(category)
        #match which card categories were given correct response
    end
    def percent_correct
        #will give back percent of correct answers
    end
    def percent_correct_by_category(category)
        #explanatory
    end
end