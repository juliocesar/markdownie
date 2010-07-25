require 'rubygems'
require 'watchr'
require 'sinatra'
require 'rdiscount'

module Markdownie
  class << self
    def watch dir
      raise ArgumentError, "dir needs to be a directory" unless File.directory? dir
      @watching = dir
    end
    
    def render file
      RDiscount.new(File.read(file)).to_html.chomp
    end
    
    def install_path
      File.expand_path File.join(File.dirname(__FILE__), '..')
    end
  end
end

get '/' do
  haml :home
end

get '/file' do
end