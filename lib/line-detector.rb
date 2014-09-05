require 'rubygems'

require 'version'

#
# LineDetector - line ending detector
#
module LineDetector
  #
  # Detect line ending format of arbitrary text
  #
  # "\r\n"   => :crlf
  # "\n\r"   => :lfcr
  # "\n"     => :lf
  # "\r"     => :cr
  # "\v"     => :vt
  # "\f"     => :ff
  # "\u2028" => :ls
  # "\u2029" => :ps
  # "\na\r"  => :mix
  # "a"      => :none
  # ""       => :none
  #
  def self.detect_line_ending_of_text(text)
    line_endings = text.split(/[^\r\n\v\f\u2028\u2029]/)
      .reject { |ending| ending == '' }
      .map { |ending| ending.gsub(/(.+?)(\1)+/m, '\1') }
      .uniq

    len = line_endings.length

    if len == 0
      :none
    elsif len == 1
      case line_endings.first
      when "\n"
        :lf
      when "\r\n"
        :crlf
      when "\n\r"
        :lfcr
      when "\r"
        :cr
      when "\v"
        :vt
      when "\f"
        :ff
      when "\u2028"
        :ls
      when "\u2029"
        :ps
      else
        :unknown
      end
    else
      :mix
    end
  end

  #
  # Detect line ending format of a file
  #
  # Assumes file is a text file.
  #
  def self.detect_line_ending_of_file(filename)
    detect_line_ending_of_text(open(filename).read)
  end
end
