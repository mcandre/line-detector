require 'line-detector'

describe LineDetector, '#detect_line_ending_of_text' do
  it 'correctly detects the line ending format of arbitrary text' do
    expect(LineDetector.detect_line_ending_of_text('abc')).to eq(:none)

    expect(LineDetector.detect_line_ending_of_text("abc\ndef\n")).to eq(:lf)

    expect(LineDetector.detect_line_ending_of_text("abc\ndef")).to eq(:lf)

    expect(LineDetector.detect_line_ending_of_text("abc\rdef\r")).to eq(:cr)

    expect(LineDetector.detect_line_ending_of_text("abc\r\ndef\r\n")).to eq(:crlf)

    expect(LineDetector.detect_line_ending_of_text("abc\n\rdef\n\r")).to eq(:lfcr)

    expect(LineDetector.detect_line_ending_of_text("abc\vdef\v")).to eq(:vt)

    expect(LineDetector.detect_line_ending_of_text("abc\fdef\f")).to eq(:ff)

    expect(LineDetector.detect_line_ending_of_text("abc\u2028def\u2028")).to eq(:ls)

    expect(LineDetector.detect_line_ending_of_text("abc\u2029def\u2029")).to eq(:ps)

    expect(LineDetector.detect_line_ending_of_text("abc\u0085def\u0085")).to eq(:nel)
  end
end

describe LineDetector, '#lines' do
  it 'splits text into lines, handling some of the more obscure line ending formats' do
    expect(LineDetector.lines('abc')).to eq(['abc'])

    expect(LineDetector.lines("abc\ndef\n")).to eq(['abc', 'def'])

    expect(LineDetector.lines("abc\ndef")).to eq(['abc', 'def'])

    expect(LineDetector.lines("abc\rdef\r")).to eq(['abc', 'def'])

    expect(LineDetector.lines("abc\r\ndef\r\n")).to eq(['abc', 'def'])

    expect(LineDetector.lines("abc\n\rdef\n\r")).to eq(['abc', 'def'])

    expect(LineDetector.lines("abc\vdef\v")).to eq(['abc', 'def'])

    expect(LineDetector.lines("abc\fdef\f")).to eq(['abc', 'def'])

    expect(LineDetector.lines("abc\u2028def\u2028")).to eq(['abc', 'def'])

    expect(LineDetector.lines("abc\u2029def\u2029")).to eq(['abc', 'def'])

    expect(LineDetector.lines("abc\u0085def\u0085")).to eq(['abc', 'def'])
  end
end
