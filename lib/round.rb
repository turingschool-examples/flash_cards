require 'pry'
class Round
    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
        
    end

    def current_card
        @deck.cards.first
    end

    def take_turn(guess)
        turn = Turn.new(guess, current_card) 
        @turns << turn
       # I have taken the turn and now 
       # I need to put the card at the bottom of the deck
        @deck.cards.rotate!

        turn
    end

    def number_correct
        # have a turn
        # have a card
        @turns.count {|turn| turn.correct?}
    end


    def number_correct_by_category(subject)
        binding.pry
        number_correct = 0
        @turns.count {|turn| {if turn.correct? && turn.category == subject}
            number_correct += 1 }
        # count the turns that have the correct answer by category
    end

    # def percent_correct
    #(@turns.count {|turn| turn.correct?}) % (@turns.count {|turns| turns.correct? != true})
    # end

    # def percent_correct_by_category

    # end
    def start
        p "Hello what is your name"
        name = gets.chomp

        p "Welcome #{name}! You are playing with 4 cards!"
        p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    
        @guess = guess.gets.chomp
        turn.feedback
    end
end