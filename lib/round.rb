class Round
    attr_reader :deck, :turns, :current_card, :take_turn
    def initialize(deck)
        @deck = deck
        @turns = turns
        @current_card = current_card
        @take_turn = take_turn
    end
    def current_card
        turns = []
        cards.first do |card|
            turns << card.take_turn
        end
        cards.find(2) do |card|
            turns << card.take_turn
        end
        cards.last do |card|
            turns << card.take_turn
        end
    end
    def take_turn(guess)
        #records appropriate guess and card to 'turns' method
        #round should move onto next card in the deck
    end
    # def turns
    #     turns_taken = []
    #     turns_taken << first_card
    #     turns_taken << second_card
    #     turns_taken << third_card

    #     #this is a list of all the turns taken this round. They are added into an array after the turn is taken
    # end
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