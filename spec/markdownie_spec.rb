require File.join(File.dirname(__FILE__), 'spec_helper')

describe Markdownie do
  it "#watch takes a directory as a parameter" do
    lambda { Markdownie.watch root + '/fixtures' }.should_not raise_error
  end
  
  it "#render reads a Markdown file and outputs HTML" do
    Markdownie.render(root + '/fixtures/short.md').should == "<p><em>ORLY</em></p>"
  end
end