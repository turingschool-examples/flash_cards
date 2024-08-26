require './lib/turn'
require './lib/deck.rb'

#needs to store a deck
#how many turns in that round  deck.cards.count
#display current card    deck.cards.??
#use round to create a turn take turn is a class object so need the turn class required
#turns = (turn(card = guess?))
#round.take_turn adds the turn to turns = 0 and removes card from the list
#when correct numer_correct = 0 + 1
#number_correct_by_category must store categories and count how many have happened, how many right
#percent_correct lists total correct vs wrong but is able to pull correct% by category


#correct methods pull how many turns exist compares to how many conatin true for @correct in turn class
#correct by category pulls same but specifies the category
#both % will use above methods but return it as a % float
#make sure to use method variables to not effect global values when needed

class Round
    attr_reader :round_deck,
                :turns,
                :score
                
                
    
    def initialize(deck)
        @round_deck = deck
        @turns = []
        @score = 0
    end

    def current_card
        round_deck.deck[0]
    end

    def take_turn(guess)
        deck_turn = @round_deck
        turn = Turn.new(guess, deck_turn.deck[0])
        @turns << turn
        deck_turn.deck.shift(1)
        turn.correct?
    end

    def number_correct
        turns = @turns
        correct = turns.map do |turn|
            turn.correct?
        end.compact
        
         @score = correct.count(true)

    end

    def number_correct_by_category(requested_category)
        turns = @turns
        correct = []
        correct = turns.map do |turn|

            (turn.correct ==true and turn.card.category == requested_category) ? correct << turn : nil
            
        end
        @score = correct.compact.count

    end

    def percent_correct
        (@score.to_f / @turns.count().to_f) * 100
    end

    def percent_correct_by_category(requested_category)
        number_correct_by_category(requested_category)
        
        cards = []
        cards = turns.map do |turn|

            (turn.card.category == requested_category) ? cards << turn : nil
            
        end
        cards = cards.compact
          
        ((@score.to_f / cards.count().to_f) * 100).round(1)

    end
                

end