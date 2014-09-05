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
* Multiple line endings (mix)
* Single-line and empty files (none)

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

$ line-detector examples/empty.html 
examples/empty.html: none

$ line-detector examples/index.min.html 
examples/index.min.html: none

$ line-detector < examples/index.html 
lf
```

# REQUIREMENTS

* [Ruby](https://www.ruby-lang.org/) 2+

# INSTALL

Install via [RubyGems](http://rubygems.org/):

```
$ gem install line-detector
```

# LICENSE

FreeBSD

# DEVELOPMENT

## Testing

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
