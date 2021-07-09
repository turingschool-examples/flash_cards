require 'spec_helper'

RSpec.describe CardGenerator do
 it 'exists' do
   cards = CardGenerator.new(filename).cards

   expect(cards).to be_a CardGenerator
 end
end
