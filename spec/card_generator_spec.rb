require "./lib/round"
require "./lib/deck"
require "./lib/card"
require "./lib/turn"
require './lib/card_generator'
require 'pry'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Card_generator do

    it 'exists' do
    new_file = Card_generator.new(lib/cards.txt)

    expect(new_file).to be_instance_of(Card_generator)
    end

end