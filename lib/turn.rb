#implements Turn class

class Turn

     def initialize(string, card)
       @guess    = string
       @card      = card
     end

     def guess()
          @guess
     end

     def card()
          @card
     end

     def correct?()
          @guess == card.answer
     end

     def feedback()
          if self.correct?
               "Correct!"
          else
               "Incorrect."
          end
     end

     def last()
          ##
     end

end
