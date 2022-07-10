class CardGenerator
  attr_reader :filename
  def initialize(filename)
    @filename = filename 
  end
  def cards
    file_content = []
    File.readlines(@filename).each do |line|
      file_content << line.gsub("\n", '').split(',')
    end  
    file_content
  end
end 