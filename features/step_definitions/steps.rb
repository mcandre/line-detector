Given(/^the program has finished$/) do
  # Test files are generated using iconv.

  @cucumber = `line-detector examples/index.html`
  @cucumber_sep = `line-detector examples/index-separated.html`
  @cucumber_ie = `line-detector examples/index-ie.html`
  @cucumber_mac = `line-detector examples/index-macweb.html`
  @cucumber_monster = `line-detector examples/index-monstrosity.html`
  @cucumber_empty = `line-detector examples/empty.txt`
  @cucumber_single_line = `line-detector examples/index.min.html`
  @cucumber_stdin = `line-detector < examples/index.html`
  @cucumber_dne = `line-detector examples/file-that-does-not-exist`
  @cucumber_lfcr = `line-detector examples/index-acorn.html`
  @cucumber_vt = `line-detector examples/index-vertical.html`
  @cucumber_ff = `line-detector examples/index-form-feed.html`
  @cucumber_ls = `line-detector examples/index-line-separator.html`
  @cucumber_ps = `line-detector examples/index-paragraph-separator.html`
  @cucumber_nel = `line-detector examples/index-next-line.html`
  @cucumber_unknown = `line-detector examples/test.txt.flip`
end

Then(/^the output is correct for each test$/) do
  lines = @cucumber.split("\n")
  expect(lines.length).to eq(1)
  expect(lines[0]).to match(%r(^examples/index.html: lf, with final eol$))

  lines_sep = @cucumber_sep.split("\n")
  expect(lines_sep.length).to eq(1)
  expect(lines_sep[0]).to match(%r(^examples/index-separated.html: lf, without final eol$))

  lines_ie = @cucumber_ie.split("\n")
  expect(lines_ie.length).to eq(1)
  expect(lines_ie[0]).to match(%r(^examples/index-ie.html: crlf, without final eol$))

  lines_mac = @cucumber_mac.split("\n")
  expect(lines_mac.length).to eq(1)
  expect(lines_mac[0]).to match(%r(^examples/index-macweb.html: cr, with final eol$))

  lines_monster = @cucumber_monster.split("\n")
  expect(lines_monster.length).to eq(1)
  expect(lines_monster[0]).to match(%r(^examples/index-monstrosity.html: mix, without final eol$))

  lines_empty = @cucumber_empty.split("\n")
  expect(lines_empty.length).to eq(1)
  expect(lines_empty[0]).to match(%r(^examples/empty.txt: none, without final eol$))

  lines_single_line = @cucumber_single_line.split("\n")
  expect(lines_single_line.length).to eq(1)
  expect(lines_single_line[0]).to match(%r(^examples/index.min.html: none, without final eol$))

  lines_stdin = @cucumber_stdin.split("\n")
  expect(lines_stdin.length).to eq(1)
  expect(lines_stdin[0]).to match(%r(^lf, with final eol$))

  lines_dne = @cucumber_dne.split("\n")
  expect(lines_dne.length).to eq(1)
  expect(lines_dne[0]).to match(%r(^examples/file-that-does-not-exist does not exist$))

  lines_lfcr = @cucumber_lfcr.split("\n")
  expect(lines_lfcr.length).to eq(1)
  expect(lines_lfcr[0]).to match(%r(^examples/index-acorn.html: lfcr, with final eol$))

  lines_vt = @cucumber_vt.split("\n")
  expect(lines_vt.length).to eq(1)
  expect(lines_vt[0]).to match(%r(^examples/index-vertical.html: vt, with final eol$))

  lines_ff = @cucumber_ff.split("\n")
  expect(lines_ff.length).to eq(1)
  expect(lines_ff[0]).to match(%r(^examples/index-form-feed.html: ff, with final eol$))

  lines_ls = @cucumber_ls.split("\n")
  expect(lines_ls.length).to eq(1)
  expect(lines_ls[0]).to match(%r(^examples/index-line-separator.html: ls, with final eol$))

  lines_ps = @cucumber_ps.split("\n")
  expect(lines_ps.length).to eq(1)
  expect(lines_ps[0]).to match(%r(^examples/index-paragraph-separator.html: ps, with final eol$))

  lines_nel = @cucumber_nel.split("\n")
  expect(lines_nel.length).to eq(1)
  expect(lines_nel[0]).to match(%r(^examples/index-next-line.html: nel, with final eol$))

  lines_unknown = @cucumber_unknown.split("\n")
  expect(lines_unknown.length).to eq(1)
  expect(lines_unknown[0]).to match(%r(^examples/test.txt.flip: unknown, without final eol$))
end
