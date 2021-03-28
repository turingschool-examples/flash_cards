require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class GameStart
    def start
        card_1 = Card.new("Who is the best character in AOT?", "Zeke", :Anime)
        card_2 = Card.new("Who won the super bowl?", "Tampa Bay", :Sports)
        @cards = [card_1, card_2]
        @deck = Deck.new(@cards)
        @round = Round.new(@deck)
        puts "Welcome! You're playing with #{@deck.count} cards."
        puts "-----------------------------------------------------"
        # puts "This is card number #{@round.current_card_number} out of #{@deck.count}."
        # puts "Question: #{@round.current_card.question}?"
        guess_input
    end

    def guess_input
        puts "This is card number #{@round.current_card_number} out of #{@deck.count}."
        puts "Question: #{@round.current_card.question}?"
        method_name(gets.chomp)
    end

    def method_name(guess_input)
        @round.take_turn(guess_input)
        feedback(guess_input)
    end

    def feedback(guess_input)
        puts @round.turns[-1].feedback
    end
end