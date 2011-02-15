# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "make_permalink/version"

Gem::Specification.new do |s|
  s.name        = "make_permalink"
  s.version     = MakePermalink::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nicolás Hock Isaza"]
  s.email       = ["nhocki@gmail.com"]
  s.homepage    = "https://github.com/nhocki/make_permalink"
  s.summary     = %q{Create dynamic permalinks from an attribute}
  s.description = %q{Gem that creates a permalink based on an objects attribute. Use make_permalink :attribute to make it work}

  s.rubyforge_project = "make_permalink"

  s.add_dependency('stringex')
  s.add_development_dependency('rspec')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
