require 'rubygems'

require 'version'

#
# LineDetector - line ending detector
#
module LineDetector
  EOL_CHARACTERS = [
    "\r",
    "\n",
    "\v",
    "\f",
    "\u2028",
    "\u2029",
    "\u0085"
  ]

  EOL2NAME = {
    "\r\n" => :crlf,
    "\n\r" => :lfcr,
    "\n" => :lf,
    "\r" => :cr,
    "\v" => :vt,
    "\f" => :ff,
    "\u2028" => :ls,
    "\u2029" => :ps,
    "\u0085" => :nel
  }

  NAME2EOL = EOL2NAME.invert

  #
  # Detect line ending format of arbitrary text
  #
  # If text uses multiple line ending formats,
  # Returns :mix.
  #
  def self.detect_line_ending_of_text(text)
    line_endings = text.split(/[^#{EOL_CHARACTERS.join('')}]/)
      .reject { |ending| ending == '' }
      .map { |ending| ending.gsub(/(.+?)(\1)+/m, '\1') }
      .uniq

    len = line_endings.length

    if len == 0
      :none
    elsif len == 1
      EOL2NAME[line_endings.first] || :unknown
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
