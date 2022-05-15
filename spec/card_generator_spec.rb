require './lib/card_generator'

RSpec.describe CardGenerator do
  describe 'initialize' do
    it 'creates and instance of CardGenerator' do
      card_generator = CardGenerator.new()

      expect(card_generator).to be_instance_of(CardGenerator)
    end
  end

  describe '' do
    it 'can load text file' do
      
    end
  end

  describe '' do
    xit 'can create cards from text file' do

    end
  end
end
