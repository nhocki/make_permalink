require 'spec_helper'

module MakePermalink
  describe Base do
    context "#included" do
      it "creates a permalink method" do
        Thingie.new("Test this thing!").should respond_to(:permalink)
      end
      
      it "fails if the field is not defined" do
        lambda { BadThingie.new.permalink }.should raise_error
      end
    end
    
    context "with default options" do
      it "should have cool permalinks with the object's id first" do
        Thingie.new("Test this thing!").permalink.should == "1-test-this-thing"
        Thingie.new("$12 Apple Pie").permalink.should == "1-12-dollars-apple-pie"
        Thingie.new("Let's Rock & Roll").permalink.should == "1-lets-rock-and-roll"
        Thingie.new("Simple english text").permalink.should == "1-simple-english-text"
        Thingie.new("Welcome to Zombo.com").permalink.should == "1-welcome-to-zombo-dot-com"
      end
    end
    
    context "without the id on the permalink" do
      it "should have even cooler permalinks without the object's id" do
        Post.new("Welcome to the Jungle!").permalink.should == "welcome-to-the-jungle"
        Post.new("It's $5 Darling!").permalink.should == "its-5-dollars-darling"
        Post.new("Jekyll & Hide").permalink.should == "jekyll-and-hide"
      end
    end
    
    context "with non-extended-ascii characters" do
      it "should have some wired permalinks" do
        NonAsciiPost.new("This.should.remove.the.dots..").permalink.should == "1-this-should-remove-the-dots"
        NonAsciiPost.new("Simple English Text").permalink.should == "1-simple-english-text"
        NonAsciiPost.new("Let's rock & roll").permalink.should == "1-let-s-rock-roll"
        NonAsciiPost.new("foo*.,/\<>%&[]{}bar").permalink.should == "1-foo-bar"
      end
    end
    
    
  end
end
