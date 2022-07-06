class Card
    initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
    end 
    end
    
    class Turn
    initialize(string, card)
    
    def guess
        puts string
    end
    
    def card
        puts card
    end
    
    def correct?
        string == answer
    end
    
    def feedback
        if answer == true
            puts "Correct!"
        else 
            puts "Incorrect."
    puts 