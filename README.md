# line-detector - line ending detector

# HOMEPAGE

https://github.com/mcandre/line-detector

# RUBYGEMS

https://rubygems.org/gems/line-detector

# ABOUT

line-detector detects the line ending format of files and arbitrary text:

* Unix (lf)
* Windows/DOS (crlf)
* Old Mac (cr)
* Acorn BBC (lfcr)
* Vertical Tab (vt)
* Form Feed (ff)
* Line Separator (ls)
* Paragraph Separator (ps)
* Next Line (nel)
* Multiple line endings (mix)
* Single-line and empty files (none)

For more information on line endings, see [Wikipedia: Newline](https://en.wikipedia.org/wiki/Newline).

# EXAMPLES

```
$ line-detector examples/index.html 
examples/index.html: lf

$ line-detector examples/index-ie.html 
examples/index-ie.html: crlf

$ line-detector examples/index-macweb.html 
examples/index-macweb.html: cr

$ line-detector examples/index-monstrosity.html 
examples/index-monstrosity.html: mix

$ line-detector examples/empty.txt
examples/empty.txt: none

$ line-detector examples/index.min.html 
examples/index.min.html: none

$ line-detector < examples/index.html 
lf
```

line-detector also features a more capable alternative to `String#lines`, that handles some of the more obscure line ending formats.

```
$ irb
> require 'line-detector'
> LineDetector.lines("abc\u0085def\u0085ghi")
 => ["abc", "def", "ghi"]
```

# REQUIREMENTS

* [Ruby](https://www.ruby-lang.org/) 2+

## Optional

* [od](http://man.cx/od) can elucidate file contents by printing the raw byte values.

There are numerous programs that can help convert files to different line ending formats:

* [dos2unix](http://waterlan.home.xs4all.nl/dos2unix.html)
* [tr](http://man.cx/tr)
* [sed](https://www.gnu.org/software/sed/)
* [awk](http://cm.bell-labs.com/cm/cs/awkbook/index.html)
* [perl](http://www.perl.org/)
* [emacs](http://www.gnu.org/software/emacs/)
* [vim](http://www.vim.org/)

# INSTALL

Install via [RubyGems](http://rubygems.org/):

```
$ gem install line-detector
```

# LICENSE

FreeBSD

# DEVELOPMENT

## Testing

Keep the logic working:

```
$ rspec
```

Keep the interface working:

```
$ cucumber
```

## Linting

Keep the code tidy:

```
$ rake lint
```

## Git Hooks

See `hooks/`.

# CREDITS

The Unix [file](http://man.cx/file) command can report CRLF files, but fails to report CRLFs in `.html` files. Hence the inspiration for line-detector.
