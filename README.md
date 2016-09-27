# Fast Data Structures for Ruby

Some default Ruby data structures are slow, I intend on putting some time to
improve their performance without sacrificing too many features. I'm still young
and full of hope!

## Installation

FDS is available in the RubyGems repository.

```bash
gem install fds
```

Alternatively, you can clone this repository and install this gem by hand.

```bash
git clone https://github.com/thomascharbonnel/ruby_fds
gem build fds.gemspec
gem install ./fds-*
```

## Is This Really Needed?

On a few elements, you won't even see the difference, standard libs may very well
be faster. But, on a few millions, there you'll begin to see the difference.

Just a small gist, [here](https://gist.github.com/thomascharbonnel/f023ca137f2b2b7021cbe2d580485cd4).
