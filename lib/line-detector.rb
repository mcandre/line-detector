require 'rubygems'
require 'ptools'

require 'version'

module LineDetector
  # Assumes input is not multi-line
  def self.detect_line_ending_of_line(line)
    if line =~ /\r\n/
      :crlf
    elsif line =~ /\n/
      :lf
    elsif line =~ /\r/
      :cr
    else
      :none
    end
  end

  def self.detect_line_ending_of_text(text)
    line_endings = text.each_line.map do |line|
      self.detect_line_ending_of_line(line)
    end.uniq

    if line_endings == []
      :none
    elsif line_endings.length == 1
      line_endings.first
    else
      :mix
    end
  end

  def self.detect_line_ending_of_file(filename)
    begin
      self.detect_line_ending_of_text(open(filename))
    rescue Errno::ENOENT
      nil
    end
  end
end
