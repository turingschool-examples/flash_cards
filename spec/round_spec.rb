require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


card1  = Card.new("What is Dr. Brown's specialty?", "Ultrasonography", "Personal")


card2 = Card.new("What does Dr. Reeve love?", "Poms", "Personal")


card3 = Card.new("What vein is best to place and IV catheter?", "Cephalic", "Medical")

turn1 = Turn.new(card1, "Chemo")

turn2 = Turn.new(card2, "Poms")

turn3 = Turn.new(card3, "Saphenous")

turns = [turn1, turn2, turn3]

cards = [card1, card2, card3]

deck = Deck.new(cards)

round = Round.new(deck)


#require 'pry'; binding.pry


RSpec.describe Round do


    it 'can give the current card' do
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
        round = Round.new(deck)
    
        expect(round.current_card).to eq(card1)
    end

    it 'starts with an empty array of turns' do

        expect(round.turns).to eq([])
      end

      it 'can update the current card to the next card in the deck' do
        round.take_turn("chemo")

        expect(round.current_card).to eq(card2)
      end

      it 'can provide feedback' do
        new_turn = round.take_turn("chemo")
        
        expect(new_turn.correct?).to be false
        expect(new_turn.feedback).to eq("incorrect.")
      end
end