require './lib/turn'


require './lib/card'


RSpec.describe Turn do
  it 'exists' do
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)
    expect(turn).to be_instance_of(Turn)
  end


  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    turn = Turn.new("Juneau", card)
      expect(turn.guess).to eq('Juneau')
  end




  it 'turn.card - should return card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.card).to eq(card)
  end


  # turn.guess - true
  it 'determines if answer is correct - outputs boolean' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.correct?).to eq(true)
  end



  # where is error coming from?
  it 'gives feedback - correct or incorrect' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.feedback).to eq("Correct!")
  end



  it 'has a guess' do
    card = Card.new("What planet is closest to the sun?", "Mercury", :STEM)

    turn = Turn.new("Saturn", card)
      expect(turn.guess).to eq('Saturn')
  end

  #incorrect guess
  it 'turn.correct - false' do
    card = Card.new("What planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    expect(turn.correct?).to eq(false)
  end

  # turn.feedback - incorrect
  it 'turn.feedback - incorrect' do
    card = Card.new("What planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    expect(turn.feedback).to eq("Incorrect.")
  end


end
