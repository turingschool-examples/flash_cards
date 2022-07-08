# frozen_string_literal: true

require './lib/card_generator'

RSpec.describe CardGenerator do
  # Uses before method to repeat code below for each it method
  before(:each) do
    @filename = 'cards.txt'
    @generator = CardGenerator.new(@filename)
    @cards = @generator.cards
  end

  it 'exists' do
    expect(@generator).to be_instance_of(CardGenerator)
  end

  it 'file exists' do
    expect(File.exists?(@filename)).to eq(true)
  end

  it 'file is a file' do
    expect(File.file?(@filename)).to eq(true)
  end

  it 'file is txt file' do
    expect(File.extname(@filename)).to eq(".txt")
  end

  it 'cards == cards' do
    expect(@cards).to eq(@cards)
  end
end
