require File.join(File.dirname(__FILE__), 'spec_helper')

describe Markdownie do
  it "#watch takes a directory as a parameter" do
    lambda { Markdownie.watch fixtures_path }.should_not raise_error
  end
  
  it "#render reads a Markdown file and outputs HTML" do
    Markdownie.render(fixtures_path + '/short.md').should == "<p><em>ORLY</em></p>"
  end
  
  it "#files returns the list of files being watched by Markdownie" do
    Markdownie.watch fixtures_path
    Markdownie.files.should == %w(recipe.md short.md)
  end
  
  it "#dir returns the directory being watched" do
    Markdownie.watch fixtures_path
    Markdownie.dir.should == fixtures_path
  end
end