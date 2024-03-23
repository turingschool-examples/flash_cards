require './lib/card'
require './lib/turn'
RSpec.configure do |config|
  config.formatter = :documentation

RSpec.describe Turn do
  it 'exists' do
    card = Turn.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(turn).to be_instance_of(Turn)
  end