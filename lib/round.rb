require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'

class Round
    attr_reader :deck, :turns, :card_index
     
    def initialize(deck) #create Round
        @deck = deck 
        @turns = []
        @card_index = 0 #set index to zero for future card cycling
    end

    def take_turn(guess) #store a guess as a Turn in an array and +1 index to move to next card
        turn = Turn.new(guess, @deck.card_at(@card_index))
        @card_index += 1
        @turns << turn 
        return turn
    end


    def current_card #returns current card at the index value in the Deck
        @deck.card_at(@card_index)
    end

    def number_correct #searches thru turn array for turns with correct guesses and counts them
        @turns.select {|turn| turn.guess.downcase == turn.card.answer.downcase }.count
    end

    def number_correct_by_category(category) #same as above but adds matching category symbol to passed in symbol requirement
        @turns.select {|turn| turn.guess.downcase == turn.card.answer.downcase && turn.card.category == category}.count
    end

    def percent_correct #same as number correct but divides by total cards in deck (after converting both to floats), multiplies by 100 to get %, and then rounds to 1 decimal place
        (((@turns.select {|turn| turn.guess.downcase == turn.card.answer.downcase }.count.to_f) / (@turns.count).to_f) * 100 ).round(1)
    end

    def percent_correct_by_category(category) #same as percent_correct but adds category qualifier to the matching cards count
        (((@turns.select {|turn| turn.guess.downcase == turn.card.answer.downcase && turn.card.category == category}.count.to_f) / (@turns.select {|turn| turn.card.category == category }.count).to_f) * 100 ).round(1)
    end
end