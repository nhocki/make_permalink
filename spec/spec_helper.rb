require 'make_permalink'

class NonAsciiPost
  include MakePermalink
  attr_reader :a, :id
  make_permalink :a, :replace_non_ascii => false
  def initialize(value)
    @a = value; @id = 1
  end
end

class Thingie
  include MakePermalink
  attr_reader :a, :id
  make_permalink :a
  
  def initialize(value)
    @a = value; @id = 1
  end
end

class Post
  include MakePermalink
  attr_reader :title, :id
  make_permalink :title, :include_id => false
  
  def initialize(value)
    @title = value; @id = 1
  end
end


class BadThingie
  include MakePermalink
  make_permalink :i_dont_exist
end

