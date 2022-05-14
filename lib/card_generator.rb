class CardGenerator

  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def text_content
    text_file_lines = []
    file = File.read(filename)

    file.each_line do |line|
      text_file_lines << line
    end

    text_file_lines
  end

end
