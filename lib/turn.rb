class Turn
  attr_reader :guess,
              :card

  def initialize(guess, card)
    @guess     = guess
    @card      = card

  end

  def correct?
    if turn.card.answer == turn.guess
      true
    else
      false
    end
  end

  def feedback
    "Correct!"
  end

end


require './lib/card'
require './lib/turn'

RSpec.describe do
  it 'exist' do
    card = Card.new("What is the capital of Alaska?","Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
 end

  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?","Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn.card
    expect(turn.guess).to eq("Juneau")
  end

  xit 'can check if guess is correct?' do
    card = Card.new("What is the capital of Alaska?","Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn.card
    expect(turn.correct?).to eq(true)
    
  end

  xit 'gives feedback on correct answers' do
    card = Card.new("What is the capital of Alaska?","Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn.card
    expect(turn.feedback).to eq("Correct!")
  end

  it 'gives feedback on incorrect answers' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    turn.card
    expect(turn.guess).to eq("Saturn")
    expect(turn.correct?).to eq(false)
    expect(turn.guess).to eq("Incorrect.")
  end
end