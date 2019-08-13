#implements Turn class

class Turn

     def initialize(string, card)
       @string    = string
       @card      = card
     end

     def guess(string)
          string
     end

     def card(card)
          card
     end

     def correct?(string,card)
          string == card.answer
     end

     def feedback(correct?)
          if correct?
               "Correct!"
          else
               "Incorrect."
          end
     end

     def last()
          ##
     end

end
