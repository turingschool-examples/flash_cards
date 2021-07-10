require './lib/card_generator'

RSpec.describe CardGenerator do
  context '#initialize' do
    it 'exists' do
      filename = 'cards.txt'
      card_generator = CardGenerator.new(filename)

      expect(card_generator).to be_instance_of(CardGenerator)
    end

    it 'has a filename' do
      filename = 'cards.txt'
      card_generator = CardGenerator.new(filename)

      expect(card_generator.filename).to eq('cards.txt')
    end
  end

  context '#cards' do

  end

  context '#clean_lines' do

  end

  context '#clean_cards_by_line' do

  end

  context '#cards_by_line' do
    it 'outputs array with each line' do

    end
  end
end
