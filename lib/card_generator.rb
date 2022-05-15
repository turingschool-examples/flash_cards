class CardGenerator

  attr_reader :cards


  def initialize(filename)
    @filename = filename
    @cards = []
    card_input = []
    card_data = File.open(@filename)
    card_data.each do |line|
       card_input = line.split(",")
       @cards << Card.new(card_input[0],card_input[1],card_input[2].chomp)

     end

  end
#not going to lie, I stuggled debugging this, after hours of google, I finally found a way. I had an Errno::ENOENT: because i didn't realize i was putting in a code that would run it via lib



end
