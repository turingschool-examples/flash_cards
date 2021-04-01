require 'rspec'
require './lib/card_generator'

describe CardGenerator do
  
  describe 'initialize' do
    it 'exists' do
    filename = 'cards.txt'
    cards = CardGenerator.new(cards.txt)

    expect(cards).is_a? CardGenerator
    end
  end

  describe '#read_file' do
    
    it 'reads file' do
    cards = CardGenerator.new(cards.txt)
    
    expect(cardgenerator.read_file).to eq ("What is 5 + 5?, 10, STEM\n
                                            What is Rachel's favorite animal?, red panda, Turing Staff\n
                                            What is Mike's middle name?, nobody knows, Turing Staff\n
                                            What cardboard cutout lives at Turing, Justin bieber, PopCulture")
    end
  end
  
end