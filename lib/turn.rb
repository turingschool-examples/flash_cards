class Turn
attr_reader :card, :guess

def initialize(card)
    @card = card
    @guess = nil
end

def user_guess
    @guess = user_guess
end

def correct?
    @guess == @card.answer
end

def feedback
    if correct
        puts "Correct!"
    else
        puts "Incorrect. The correct answer was #{card.answer} ."
    end

    end
end    