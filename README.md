# line-detector - line ending detector

# HOMEPAGE

https://github.com/mcandre/line-detector

# RUBYGEMS

https://rubygems.org/gems/line-detector

# ABOUT

line-detector detects the line ending format of files and arbitrary text:

* Unix = `:lf`
* Windows/DOS = `:crlf`
* Old Mac = `:cr`
* Multiple line endings = `:mix`
* Single-line and empty files = `nil`

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
