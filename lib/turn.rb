#implements Turn class

class Turn

     attr_reader    :guess, :card

     def initialize(string, card)
       @guess    = string
       @card      = card
     end

     def correct?
          @guess.downcase == @card.answer.downcase
     end

     def feedback
          if correct?
               "Correct!"
          else
               "Incorrect."
          end
     end

end
