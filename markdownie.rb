require 'rubygems'
require 'watchr'
require 'sinatra'
require 'pathname'
require 'rdiscount'

module Markdownie
  class << self
    def watch dir
      raise ArgumentError, "dir needs to be a directory" unless File.directory? dir
      @watching = Pathname.new(dir)
      @files    = Dir["#{dir}/*.md"].map { |f| Pathname.new(f).relative_path_from(@watching).to_s }
    end
    
    def render file
      RDiscount.new(File.read(@watching + file)).to_html.chomp
    end
    
    def files
      @files
    end
    
    def dir
      @watching.to_s
    end
    
    def install_path
      Pathname.new(__FILE__).dirname.parent.to_s
    end
  end
end

Markdownie.watch 'spec/fixtures'

get '/' do
  haml :home, :layout => false
end

get '/file/:path' do
  Markdownie.render params[:path]
end