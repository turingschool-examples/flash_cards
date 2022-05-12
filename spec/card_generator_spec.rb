require './lib/card_generator'
require 'pry'

RSpec.describe CardGenerator do
  it 'can store a text file' do

    filename = "cards.txt"
    generator = CardGenerator.new(filename)

    expect(generator.filename).to eq("cards.txt")
  end

    # text_to_cards = generator.cards
    # binding.pry
    # expect(generator).to be_instance_of(CardGenerator)
  # end


end
