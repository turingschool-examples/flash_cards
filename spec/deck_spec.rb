require 'pry'
require './lib/card'
require './lib/deck'


RSpec.describe Card do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to be_instance_of(Card)
  end

  # require 'pry'; binding.pry
end
