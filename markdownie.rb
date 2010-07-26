require 'rubygems'
require 'sinatra'
require 'sinatra/async'
require 'pathname'
require 'rdiscount'
require 'json'

module Markdownie
  class << self
    def watch dir
      raise ArgumentError, "dir needs to be a directory" unless File.directory? dir
      @watching = Pathname.new(dir)
    end

    def render file
      RDiscount.new(File.read(@watching + file)).to_html.chomp
    end

    def files
      @files = Dir["#{dir}/*.md"].map { |file| Pathname.new(file).relative_path_from(@watching).to_s }
    end

    def dir
      @watching.cleanpath.to_s
    end

    def install_path
      Pathname.new(__FILE__).dirname.realpath.to_s
    end

    def css_path stylesheet
      source = File.exists?(dir + "/css/#{stylesheet}") ? dir : install_path
      source + "/css/#{stylesheet}"
    end
  end
end

configure do
  set :port => 5678
  Sinatra.register Sinatra::Async
end

get '/' do
  @files = Markdownie.files
  @dir = Markdownie.dir
  haml :home
end

get '/css/:css' do
  content_type 'text/css'
  File.read Markdownie.css_path(params[:css])
end

aget '/file/:path' do
  file  = Markdownie.dir + "/#{params[:path]}"
  mtime = File.mtime(file)
  @markup = Markdownie.render params[:path]
  body haml(:file) unless params[:raw]
  timer = EM::PeriodicTimer.new(0.2) do
    timer.cancel and body(Markdownie.render(params[:path])) if mtime < File.mtime(file)
    mtime = File.mtime(file)
  end
end