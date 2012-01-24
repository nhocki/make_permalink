# Make Permalink [![Build Status](https://secure.travis-ci.org/nhocki/make_permalink.png)](http://travis-ci.org/nhocki/make_permalink)

`make_permalink` is a simple gem that allows you to easily create Permalinks (url-friendly-output) for methods in your objects. You don't need any database storage to make it work which is just awesome!

## Example

```ruby
  class Post
    make_permalink :title
  end

  p = Post.create(:title => "Hello World!")
  p.permalink   # => "1-hello-world"
```

If you're using Rails and you want your URLs to have the Permalink and not only the id, just override the `to_param` method to your model:

```ruby
  class Post < ActiveRecord::Base
    make_permalink :title

    def to_param
      permalink
    end
  end
```

# Install

To install `make_permalink` just add it to your Gemfile and run `bundle install`

`gem 'make_permalink'`


## Options

### Non ascii characters

You can have a Permalink that won't change non-ascii.

`:replace_non_ascii`: If set to false non-ascii chars won't be replaced. Default is true

```ruby
  class Post
    make_permalink :title, :replace_non_ascii => false
  end

  p = Post.create(:title => "Let's rock & roll")
  p.permalink   # => "1-let-s-rock-roll"
```

Notice that if you don't replace non-ascii chars the gem will try to convert the symbols to workds.

```ruby
  # You will get this with the default behavior 
  p.permalink  # => "1-lets-rock-and-roll"
```

### Remove id from permalink

I don't really like to have the ID of the object on the Permalink, so I just added an option to remove it. Just call the method with `:include_id => false` and you're done! The problem with this is that querying would be much harder, since you don't have a `permalink` column in your database.

`:include_id`: is true by default but just change it to remove the id from the Permalink.

# Bugs/Contact

If you need to contact me about a bug or anythig, please open an [issue](https://github.com/nhocki/make_permalink/issues).

Also, feel free to patch it as needed, every fix/refactoring/extension is more than welcome!


Nicolás Hock Isaza    
[@nhocki](http://twitter.com/nhocki) on Twitter   
nhocki@gmail.com   

Copyright (c) 2012 Nicolás Hock Isaza, released under the MIT license
