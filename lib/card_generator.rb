require './lib/card'

require './lib/turn'

require './lib/deck'

require './lib/round'

class CardGenerator
  attr_reader :filename
  def initialize(filename)
    @filename = filename

    #@filename.gets.chomp
  end
end