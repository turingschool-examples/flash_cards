require './lib/card_generator.rb'
require 'pry'

RSpec.describe CardGenerator do
    it 'exists' do
        filename = "cards.txt"
        cg = CardGenerator.new(filename)

        expect(cg).to be_a(CardGenerator)
    end

    it 'can read a text file' do
        filename = "cards.txt"
        cg = CardGenerator.new(filename)

        expect(cg.read_file).to eq(["What is 5 + 5?,10,STEM","What is Rachel's favorite animal?,red panda,Turing Staff","What is Mike's middle name?,nobody knows,Turing Staff","What cardboard cutout lives at Turing?,Justin bieber,PopCulture"])
    end
end