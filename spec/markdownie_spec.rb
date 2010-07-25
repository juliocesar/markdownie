require File.join(File.dirname(__FILE__), 'spec_helper')

describe Markdownie do
  before do
    Markdownie.watch fixtures_path
  end
  
  it "#watch takes a directory as a parameter" do
    lambda { Markdownie.watch fixtures_path }.should_not raise_error
  end
  
  it "#render reads a Markdown file and outputs HTML" do
    Markdownie.render('short.md').should == "<p><em>ORLY</em></p>"
  end
  
  it "#files returns the list of files being watched by Markdownie" do
    Markdownie.files.should == %w(recipe.md short.md)
  end
  
  it "#dir returns the directory being watched" do
    Markdownie.watch fixtures_path
    Markdownie.dir.should == Pathname.new(fixtures_path).cleanpath.to_s
    
  end
  
  context 'deciding whether to CSS files' do
    it "uses one found in the directory provided by the user" do
      File.should_receive(:exists?).with("#{Markdownie.dir}/css/forlols.css").and_return(true)
      Markdownie.css_path 'forlols.css'
    end
    
    it "uses one found in Markdownie's install path if one provided by the user is not found" do
      File.should_receive(:exists?).with("#{Markdownie.dir}/css/screen.css").and_return(false)
      Markdownie.css_path 'screen.css'
    end
  end
end