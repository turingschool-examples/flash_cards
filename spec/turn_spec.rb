require './lib/turn'
require './lib/card'


RSpec.describe Turn do

  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('Juneau', card)
    expect(turn).to be_instance_of(Turn)
  end

  describe '#correct?' do
    it 'returns correct turn evaluation as a boolean' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      true_turn = Turn.new('Juneau', card)
      expect(true_turn.correct?).to eq(true)
      false_turn = Turn.new('bla bla answer', card)
      expect(false_turn.correct?).to eq(false)
    end
  end

  describe '#feedback' do
    it 'returns a correct feedback string' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      true_turn = Turn.new('Juneau', card)
      expect(true_turn.feedback).to eq('Correct!')
      false_turn = Turn.new('bla bla answer', card)
      expect(false_turn.feedback).to eq('Incorrect.')
    end
  end


end
