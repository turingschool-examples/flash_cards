require 'pry'
require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  describe "Turn" do
    it "needs a library" do
      expect { Turn.new }.to raise_error(ArgumentError)
    end
  end

  it 'does card exist' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card).to be_instance_of(Card)
  end
#binding.pry

  it 'does turn exist' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn).to be_instance_of(Turn)
  end


  it 'has a location' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card).to eq(card)
  end


end
