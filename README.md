proprocks
=========

Proprocks adds some sugar to Ruby class initialization. It provides a simple
method for adding properties (with defaults), and for assigning them when you 
create an object with either a hash syntax or DSL style block. 

## Example

```ruby
require 'proprocks'

class Foo
  include PropRocks

  # add two properties, one called bar, the other called fizz. 
  # fizz gets a default value of 'buzz'.
  prop :bar
  prop :fizz, 'buzz'
end

# Basics
a = Foo.new

a.bar # nil
a.fizz # 'buzz'

# Initialize with hash syntax
a = Foo.new :bar => 'blah'

a.bar # 'blah'
a.fizz # 'buzz'

# Hash syntax overrides default!
a = Foo.new :bar => 'blah', :fizz => 'whizz'

a.bar # 'blah'
a.fizz # 'whizz'

# Initialize with DSL-style block syntax. This overrides defaults too!
a = Foo.new do
  bar 'blorg'
  fizz 'whorg'
end

a.bar # 'blorg'
a.fizz # 'whorg'

# Initialize with Hash and DSL-style together. DSL overrides Hash!
a = Foo.new(:bar => 'blaggle', :fizz => 'waggle') do
  fizz 'whorggle'
end

a.bar # 'blaggle'
a.fizz # 'whorggle'
  
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'proprocks'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install proprocks
```

## Usage

Once installed you just need to require it:

```ruby
require 'proprocks'
```
