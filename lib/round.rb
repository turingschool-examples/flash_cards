#implements Round class

class Round

     def initialize(deck)
       @deck    = deck
       @index   = 0
       @cards_correct = []
     end

     def take_turn(guess)
          turn = Turn.new(guess, deck.cards[index])
          index = index + 1
          if turn.correct?
               cards_correct << deck.cards[index]
          end
     end

     def turns(index)
          deck[0..(index-1)]
     end

     def current_card(index)
          deck[index]
     end

     def number_correct()
          cards_correct.length
     end

     def current_card()
          deck.cards[index]
     end

     def count()
          index - 1
     end

     def number_correct_by_category(category)
          cards_correct.each {
               a << cards_correct.category == category
               }
          end
          a.length
     end

end
