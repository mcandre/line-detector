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

describe LineDetector, '#detect_final_eol_of_text' do
    it 'detects the presence of a final end of line in arbitrary text' do
        expect(LineDetector.detect_final_eol_of_text('abcdef')).to eq(false)
        expect(LineDetector.detect_final_eol_of_text("abc\ndef\n")).to eq(true)
        expect(LineDetector.detect_final_eol_of_text("abc\ndef")).to eq(false)
        expect(LineDetector.detect_final_eol_of_text("abc\r\ndef\r\n")).to eq(true)
        expect(LineDetector.detect_final_eol_of_text("abc\r\ndef")).to eq(false)
        expect(LineDetector.detect_final_eol_of_text("abc\r\ndef\n")).to eq(false)
    end
end
