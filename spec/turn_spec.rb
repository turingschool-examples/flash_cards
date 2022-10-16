require 'rspec'
require './lib/turn'
require './lib/card'

describe Turn do
  describe '#initialize' do
    it 'is an instance of turn' do
      card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      turn = Turn.new('Juneau', card)

      expect(turn).to be_instance_of(Turn)
    end

    it 'has cards' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card_2 = Card.new('Which planet is closest to the sun?', 'Mercury', :STEM)
      turn_1 = Turn.new('Juneau', card_1)
      turn_2 = Turn.new('Mercury', card_2)

      expect(turn_1.card).to eq(card_1)
      expect(turn_2.card).to eq(card_2)
    end

    it 'has guesses' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card_2 = Card.new('Which planet is closest to the sun?', 'Mercury', :STEM)
      turn_1 = Turn.new('Juneau', card_1)
      turn_2 = Turn.new('Saturn', card_2)

      expect(turn_1.guess).to eq('Juneau')
      expect(turn_2.guess).to eq('Saturn')
    end
  end

  describe '#correct?' do
    it 'compares guess and answer and returns appropriate boolean' do
      card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      turn_1 = Turn.new('Juneau', card)
      turn_2 = Turn.new('Voyageur', card)

      expect(turn_1.correct?).to be true
      expect(turn_2.correct?).to be false
    end

    it 'sanitizes guess to accept minor variation' do
      card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      turn_1 = Turn.new('juneau', card)
      turn_2 = Turn.new(' juneau ', card)

      expect(turn_1.correct?).to be true
      expect(turn_2.correct?).to be true
    end
  end

  describe '#feedback' do
    it 'provides feedback to reflect correct answer' do
      card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      turn_1 = Turn.new('Juneau', card)
      turn_2 = Turn.new('Anchorhead', card)

      expect(turn_1.feedback).to eq('Correct!')
      expect(turn_2.feedback).to eq('Incorrect. The correct answer is Juneau')
    end
  end
end
