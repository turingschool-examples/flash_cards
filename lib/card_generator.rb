class CardGenerator
  attr_reader :filename
  def initialize(filename)
    @filename = filename 
  end
  def cards
    file_content = []
    File.readlines(@filename).map do |line|
      file_content << line.gsub("\n", '').split(',')
      card_content = Card.new(file_content[0][0], file_content[0][1], file_content[0][2])
    end   
  end
end 