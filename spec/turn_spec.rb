require 'rspec'
require './lib/turn'
require './lib/card'



describe Turn do
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

  it 'exists' do
    turn = Turn.new("Juneau", card)
    expect(turn).to be_instance_of(Turn)
  end

   it 'has a guess' do

   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
   turn = Turn.new("Juneau", card)
   expect(turn.guess).to eq("Juneau")
   end

   it 'has a card' do

     turn = Turn.new("Juneau", card)
     expect(turn.current_card).to eq (card)
   end

   #it 'has the cards answer' do
    #turn = Turn.new("Juneau", card)
    #expect(turn.answer).to eq(current_card)
  #end

  describe '#correct?' do
    it 'returns true if guess equals the answer' do

    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.guess).to eq(card.answer)
    end

    it 'returns false if card does not equal answer' do

      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Junope", card)
      expect(turn.guess).to_not eq(card.answer)
    end
  end

  describe '#feedback' do
    it 'returns true if guess was correct' do
#??????? keeps returning false. fixed turn.rb, works now
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn.guess
    expect(turn.correct?).to eq(true)

  end

    it ' returns false if guess was incorrect' do
      skip
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Junope", card)
      expect(turn.correct?).to eq(false)
    end
 end
end
