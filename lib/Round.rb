require_relative 'Card'
require_relative 'Deck'

Class Round 

    attr_reader :deck, :round
    
    def initialize(deck, round)
        @deck = deck
        @round = round
    end

    def start 
        puts "Welcome to Brody's Flashcard game!"
    end

    loop do
        current_card = @cards[@current_card_index]
        puts "#{card.question}"

        def play
        if @deck.size > 0
            puts card
            answer = gets.chomp
        end
        
        if user_answer == answer
            puts "Correct!"
        elsif
            puts "Incorrect. The correct answer is: #{current_card.answer}"
        end

