require './turn'
require './card'
require 'rspec'

RSpec.describe Turn do
  it 'exists' do
    turn = Turn.new("Juneau")

    expect(turn).to be_instance_of(Turn)
  end

it 'has a guess' do
  turn = Turn.new("Juneau")

  expect(turn.guess).to eq("Juneau")
end




end
