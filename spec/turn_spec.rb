require './lib/turn'
require './lib/card'
<<<<<<< HEAD
require 'pry'
=======
>>>>>>> d84564ef930ea3a87ade50f2ce92453e41bb48ec

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

<<<<<<< HEAD
  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to_not be nil
  end

  it "returns that answer is correct" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to be true
  end

  it "returns that answer is NOT correct" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("DREW", card)

    expect(turn.correct?).to be false
  end

  it "returns 'Correct' feedback when guess is right" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.feedback).to eq("Correct!")
  end

  it "returns 'Incorrect' feedback when guess is wrong" do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    expect(turn.feedback).to eq("Incorrect.")
=======
  it 'is correct?' do
    
>>>>>>> d84564ef930ea3a87ade50f2ce92453e41bb48ec
  end
end
