Given(/^the program has finished$/) do
  # Test files are generated using iconv.

  @cucumber = `line-detector examples/index.html`
  @cucumber_ie = `line-detector examples/index-ie.html`
  @cucumber_mac = `line-detector examples/index-macweb.html`
  @cucumber_monster = `line-detector examples/index-monstrosity.html`
  @cucumber_empty = `line-detector examples/empty.html`
  @cucumber_single_line = `line-detector examples/index-compressed.html`
end

Then(/^the output is correct for each test$/) do
  lines = @cucumber.split("\n")
  expect(lines.length).to eq(1)
  expect(lines[0]).to match(%r(^:lf$))

  lines_ie = @cucumber_ie.split("\n")
  expect(lines_ie.length).to eq(1)
  expect(lines_ie[0]).to match(%r(^:crlf$))

  lines_mac = @cucumber_mac.split("\n")
  expect(lines_mac.length).to eq(1)
  expect(lines_mac[0]).to match(%r(^:cr$))

  lines_monster = @cucumber_monster.split("\n")
  expect(lines_monster.length).to eq(1)
  expect(lines_monster[0]).to match(%r(^:mix$))

  lines_empty = @cucumber_empty.split("\n")
  expect(lines_empty.length).to eq(1)
  expect(lines_empty[0]).to match(%r(^nil$))

  lines_single_line = @cucumber_single_line.split("\n")
  expect(lines_single_line.length).to eq(1)
  expect(lines_single_line[0]).to match(%r(^nil$))
end
