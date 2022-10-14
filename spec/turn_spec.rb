require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Juneau", card)
    turn2 = Turn.new("Juneau", card2)


    expect(turn).to be_instance_of(Turn)
    expect(turn2).to be_instance_of(Turn)
  end

  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Juneau", card)
    turn2 = Turn.new("Saturn", card2)


    expect(turn.guess).to eq("Juneau")
    expect(turn2.guess).to eq("Saturn")
  end

  describe "#correct?" do

    it 'will downcase all guesses and answers' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn = Turn.new("Juneau", card)
      turn2 = Turn.new("Saturn", card2)

      expect(turn.guess.downcase).to eq("juneau")
      expect(turn2.guess.downcase).to eq("saturn")
      expect(card.answer.downcase).to eq("juneau")
      expect(card2.answer.downcase).to eq("mercury")
    end


    it 'knows if the answer is correct' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)


      expect(turn.correct?).to eq(true)
    end

    it 'knows if the answer is incorrect' do
      card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn2 = Turn.new("Saturn", card2)

      expect(turn2.correct?).to eq(false)
    end
  end

  it 'will give you feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Juneau", card)
    turn2 = Turn.new("Saturn", card2)


    expect(turn.feedback).to eq("Correct!")
    expect(turn2.feedback).to eq("Incorrect!")
  end



end
