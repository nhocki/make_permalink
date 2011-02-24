require 'stringex'
require 'make_permalink/base'

if defined?(ActiveRecord)
  ActiveRecord::Base.send :include, MakePermalink
end
