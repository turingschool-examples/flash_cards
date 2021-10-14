require './lib/turn'


RSpec.describe Turn do

  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('Juneau', card)
    expect(turn).to be_instance_of(Turn)
  end

  describe '#correct?' do
    it 'can return true if answer is true' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      true_turn = Turn.new('Juneau', card)
      expect(true_turn.correct?).to eq(true)
    end
    it 'can return false if answer is false' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      false_turn = Turn.new('bla bla answer', card)
      expect(false_turn.correct?).to eq(false)
    end
  end

  describe '#feedback' do
    it 'can return true feedback string if answer is true' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      true_turn = Turn.new('Juneau', card)
      expect(true_turn.feedback).to eq('Correct!')
    end
    it 'can return false feedback string if answer is false' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      false_turn = Turn.new('bla bla answer', card)
      expect(false_turn.feedback).to eq('Incorrect.')
    end
  end


end
