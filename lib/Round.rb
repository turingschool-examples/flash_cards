require_relative 'Card'
require_relative 'Deck'

Class Round 

    attr_reader :round 
    
    def initialize(deck)
        @deck = deck
    end

    def start 
        puts "Welcome to Brody's Flashcard game!"
    end

   # def current_card
  #      @deck.draw_card
   #     puts "#{card.question}"
   # end

    loop do
        current_card = @cards[@current_card_index]
        puts "#{card.question}"
        
        if user_answer == answer
            puts "Correct!"
        elsif
            puts "Incorrect. The correct answer is: #{current_card.answer}"
        end