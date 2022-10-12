require 'rspec'
require './lib/turn'
require './lib/card'
#added this card file otherwise I get,
#"uninitialized constant Card error


describe Turn do
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #added this otherwise I get
  #undefined card variable error

  it 'exists' do
    turn = Turn.new("Juneau", card)
    expect(turn).to be_instance_of(Turn)
  end
  #this works? Okay? What?

   it 'has a guess' do
   turn = Turn.new("Juneau", card)
   expect(turn.guess).to eq("Juneau")
   end
   #this also works? Okay? HUH?!

   it 'has a card' do
     turn = Turn.new("Juneau", card)
     expect(turn.current_card).to eq (card)
   end

   it 'has the cards answer'
    turn = Turn.new("Juneau", card)
    expect(turn.answer).to eq(current_card.answer)
  end

  describe '#correct?' do
    it 'returns true if guess equals the answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.guess).to eq(turn.answer)
    end

    it 'returns false if card does not equal answer' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Junope", card)
      expect(turn.guess).to_not eq(turn.answer)
    end
  end

  describe '#feedback' do
    it 'returns true if guess was correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.correct).to eq(true)
  end
    it ' returns false if guess was incorrect' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Junope", card)
      expect(turn.correct).to eq(false)
    end
end
