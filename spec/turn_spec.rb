require './lib/card'
require './lib/turn'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Turn do
  it 'exists' do
    card = Turn.new("Juneau", card)
    expect(turn).to be_instance_of(Turn)
  end

end
