require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Round

    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
    end

    def current_card
        @deck.cards[0]
    end

    def take_turn(guess)
        #make a new turn. 
        #pass guess and current card
        turn = Turn.new(guess, current_card)
        #when take turn gets used push new_turn into @turns and then shuffle the card in the deck so it wont repeat
       turns = @turns.push(turn) #add count to turns array
       @deck.cards.shift
       turn

    end

    def number_correct
    turns.count do |turn|
        turn.correct?
      end

    end

    # def new_turn
    #      round.take_turn(guess)
    # end
            
        def number_correct_by_category(category)
        category_selected_array = turns.select do |turn|
                turn.card.category == category
        end
            
            category_selected_array.count do |turn|
                turn.correct?
        end
    end

        
        def percent_correct
          
            number_correct.to_f / @turns.count.to_f * 100
        end
        

        def percent_correct_by_category (category)
            (number_correct_by_category(category).to_f / number_correct.to_f) * 100.round(1)
          end




end
                


    

    # # def correct?(new_turn)
    # #     @guess == @answer
       
    # end

