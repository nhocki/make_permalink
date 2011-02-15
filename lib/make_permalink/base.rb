module MakePermalink
  
  def self.included(base)
    base.extend Base
  end
  
  def create_url_string(method, replace_non_ascii)
    if replace_non_ascii
      self.send(method.to_sym).to_s.to_url
    else
      create_non_ascii_url(method)
    end
  end
  
  def create_non_ascii_url(method)
    self.send(method.to_sym).gsub(/[^\w]+/,"-").downcase
  end
  
  def create_permalink_prefix(include_id)
    "#{id}-" if include_id
  end
  
  module Base
    def default_options
      {
        :replace_non_ascii => true,
        :include_id => true
      }
    end
    
    def make_permalink(method, options = {})
      define_method "permalink" do
        options = self.class.default_options.merge!(options)
        # Remember to remove the trailing dashes! That's the last gsub
        "#{self.create_permalink_prefix(options[:include_id]).to_s + 
          self.create_url_string(method, options[:replace_non_ascii]).to_s}".gsub(/-$/, "")
      end
    end
    
    
  end
  
end
