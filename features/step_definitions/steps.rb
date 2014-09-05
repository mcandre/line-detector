Given(/^the program has finished$/) do
  # Test files are generated using iconv.

  @cucumber = `line-detector examples/index.html`
  @cucumber_sep = `line-detector examples/index-separated.html`
  @cucumber_ie = `line-detector examples/index-ie.html`
  @cucumber_mac = `line-detector examples/index-macweb.html`
  @cucumber_monster = `line-detector examples/index-monstrosity.html`
  @cucumber_empty = `line-detector examples/empty.html`
  @cucumber_single_line = `line-detector examples/index.min.html`
  @cucumber_stdin = `line-detector < examples/index.html`
  @cucumber_dne = `line-detector examples/file-that-does-not-exist`
  @cucumber_lfcr = `line-detector examples/index-acorn.html`
  @cucumber_vt = `line-detector examples/index-vertical.html`
  @cucumber_ff = `line-detector examples/index-form-feed.html`
end

Then(/^the output is correct for each test$/) do
  lines = @cucumber.split("\n")
  expect(lines.length).to eq(1)
  expect(lines[0]).to match(%r(^examples/index.html: lf$))

  lines_sep = @cucumber_sep.split("\n")
  expect(lines_sep.length).to eq(1)
  expect(lines_sep[0]).to match(%r(^examples/index-separated.html: lf$))

  lines_ie = @cucumber_ie.split("\n")
  expect(lines_ie.length).to eq(1)
  expect(lines_ie[0]).to match(%r(^examples/index-ie.html: crlf$))

  lines_mac = @cucumber_mac.split("\n")
  expect(lines_mac.length).to eq(1)
  expect(lines_mac[0]).to match(%r(^examples/index-macweb.html: cr$))

  lines_monster = @cucumber_monster.split("\n")
  expect(lines_monster.length).to eq(1)
  expect(lines_monster[0]).to match(%r(^examples/index-monstrosity.html: mix$))

  lines_empty = @cucumber_empty.split("\n")
  expect(lines_empty.length).to eq(1)
  expect(lines_empty[0]).to match(%r(^examples/empty.html: none$))

  lines_single_line = @cucumber_single_line.split("\n")
  expect(lines_single_line.length).to eq(1)
  expect(lines_single_line[0]).to match(%r(^examples/index.min.html: none$))

  lines_stdin = @cucumber_stdin.split("\n")
  expect(lines_stdin.length).to eq(1)
  expect(lines_stdin[0]).to match(%r(^lf$))

  lines_dne = @cucumber_dne.split("\n")
  expect(lines_dne.length).to eq(1)
  expect(lines_dne[0]).to match(%r(^examples/file-that-does-not-exist does not exist$))

  lines_lfcr = @cucumber_lfcr.split("\n")
  expect(lines_lfcr.length).to eq(1)
  expect(lines_lfcr[0]).to match(%r(^examples/index-acorn.html: lfcr$))

  lines_vt = @cucumber_vt.split("\n")
  expect(lines_vt.length).to eq(1)
  expect(lines_vt[0]).to match(%r(^examples/index-vertical.html: vt$))

  lines_ff = @cucumber_ff.split("\n")
  expect(lines_ff.length).to eq(1)
  expect(lines_ff[0]).to match(%r(^examples/index-form-feed.html: ff$))
end
