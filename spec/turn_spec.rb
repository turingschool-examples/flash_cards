require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  # test it exists
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    new_turn = Turn.new("Juneau", card_1)
    
    expect(new_turn).to be_instance_of(Turn)
  end

  # test it has a card
  it 'has a card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    new_turn = Turn.new(card_1, "Juneau")

    
    expect(new_turn.card).to eq(card_1)
  end
  # it has a guess
  it 'has a guess' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    new_turn = Turn.new(card_1, "Juneau")

    expect(new_turn.guess).to eq("Juneau")
    # new_turn = Turn.new(card_1, )
    # expect(new_turn.guess).to eq(nil)
  end
  # it checks if correct
  it 'checks if correct' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    new_turn = Turn.new(card_1, "Juneau")

    # require 'pry'; binding.pry

    expect(new_turn.correct?).to eq(true)

    new_turn = Turn.new(card_1, "juneau")
    # require 'pry'; binding.pry
    expect(new_turn.correct?).to eq(true)

    new_turn = Turn.new(card_1, "juneau   ")
    # require 'pry'; binding.pry
    expect(new_turn.correct?).to eq(true)

    new_turn = Turn.new(card_1, "    juneau   ")
    # require 'pry'; binding.pry
    expect(new_turn.correct?).to eq(true)

    new_turn = Turn.new(card_1, "Sitka")
    expect(new_turn.correct?).to eq(false)


  end
  # it provides feedback
  it 'provides feedback' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    new_turn = Turn.new(card_1, "Juneau")

    expect(new_turn.feedback).to eq("Correct!")
    new_turn = Turn.new(card_1, "Sitka")
    expect(new_turn.feedback).to eq("Incorrect.")



  end



end