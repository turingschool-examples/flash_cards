class CardGenerator
  attr_reader :filename
  def initialize(filename)
    @filename = filename 
  end
  def cards
    file_content = []
    File.readlines(@filename).map do |line|
      file_content << line.gsub("\n", '').split(',')
      file_content.map do |line|
        @cards = Card.new(line[0], line[1], line[2])   
      end 
      @cards 
    end  
  end
end 