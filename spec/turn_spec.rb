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

end
