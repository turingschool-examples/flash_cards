require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

RSpec.describe Round do

  let(:card_1) { Card.new("What is a blue?", "Color", :Basics) }
  let(:card_2) { Card.new("What is water?", "Liquid", :STEM) }
  let(:card_3) { Card.new("What is a bear?", "Animal", :Basics) }
  let(:deck) { Deck.new([card_1, card_2, card_3]) }
  let(:round) { Round.new(deck) }

  describe '#initialize' do
    it 'is a round class' do
      expect(round).to be_a Round
    end

    it 'has an empty array of turns' do
      expect(round.turns).to eq([])
    end

    it 'creates an array of categories' do
      expect(round.categories).to eq([:Basics, :STEM])
    end

    it 'starts with a turn_count of 0' do
      expect(round.turn_count).to eq(0)
    end
  end

  describe '#current_card' do
    it 'returns the first card in decks card array' do
      expect(round.current_card).to eq(card_1)
    end
  end  

  describe '#take_turn' do
    it 'creates a new instance of turn class' do
      new_turn = round.take_turn("Color")

      expect(new_turn).to be_a Turn
    end

    it 'adds the new instance of turn to round.turns' do
      new_turn = round.take_turn("Color")

      expect(round.turns.first).to eq(new_turn)
    end

    it 'counts each guess made' do
      expect(round.turn_count).to eq(0)

      new_turn = round.take_turn("Color")
      expect(round.turn_count).to eq(1)
    end
  end

  describe '#number_correct' do
    it 'returns the number of correct guesses thus far' do
      expect(round.number_correct).to eq(0)

      new_turn = round.take_turn("Color")
      expect(round.number_correct).to eq(1)
    end
   
    it 'can accurately count multiple correct answers' do
      expect(round.number_correct).to eq(0)

      new_turn = round.take_turn("Color")
      expect(round.number_correct).to eq(1)

      another_turn = round.take_turn("Liquid") 
      expect(round.number_correct).to eq(2)
    end
    
    it 'does not count incorrect answers' do
      expect(round.number_correct).to eq(0)

      new_turn = round.take_turn("Color")
      expect(round.number_correct).to eq(1)

      another_turn = round.take_turn("Liquid") 
      expect(round.number_correct).to eq(2)

      yet_another_turn = round.take_turn("Bad Answer")
      expect(round.number_correct).to eq(2)
    end
  end

  describe '#number_correct_by_category' do
    it 'returns the number of correct guesses by category' do
      expect(round.number_correct_by_category(:Basics)).to eq(0)

      new_turn = round.take_turn("Color")
      expect(round.number_correct_by_category(:Basics)).to eq(1)
    end
    
    it 'does not count wrong guesses in category' do
      expect(round.number_correct_by_category(:Basics)).to eq(0)
      
      new_turn = round.take_turn("Color")
      expect(round.number_correct_by_category(:Basics)).to eq(1)

      yet_another_turn = round.take_turn("Bad Answer")
      expect(round.number_correct_by_category(:Basics)).to eq(1) 
    end
  end

  describe '#percent_correct' do
    it 'returns 100.0 for a correct guess on first card' do
      expect(round.percent_correct).to eq(0)
      
      new_turn = round.take_turn("Color")
      expect(round.percent_correct).to eq(100.0)  
    end

    it 'returns 50.0 with one correct out of two turns' do
      expect(round.percent_correct).to eq(0)
      
      new_turn = round.take_turn("Color")
      new_turn = round.take_turn("Wrong Answer")
      expect(round.percent_correct).to eq(50.0)  
    end      
  end 

  describe '#percent_correct_by_category' do
    it 'returns 50.0 for one correct answer out of two in category' do
      expect(round.percent_correct_by_category(:Basics)).to eq(0)

      new_turn = round.take_turn("Color")
      new_turn = round.take_turn("Wrong Answer")
      new_turn = round.take_turn("Another Wrong Answer")
      expect(round.percent_correct_by_category(:Basics)).to eq(50.0)  
    end
  end

  describe '#finished?' do
    it 'returns true when all cards have been played' do
      expect(round.finished?).to be false        

      new_turn = round.take_turn("Color")
      another_turn = round.take_turn("Liquid") 
      yet_another_turn = round.take_turn("Bad Answer")
      expect(round.finished?).to be true
    end
  end
end

