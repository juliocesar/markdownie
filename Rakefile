require File.join(File.dirname(__FILE__), 'spec', 'spec_helper')
require 'spec/rake/spectask'

Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/*_spec.rb']
  t.spec_opts = ['--colour', '--format nested']
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name                = "markdownie"
    gem.summary             = "Real time Markdown on the browser"
    gem.description         = "Watches a directory with markdown files and outputs HTML to a browser"
    gem.email               = "julio.ody@gmail.com"
    gem.homepage            = "http://github.com/juliocesar/markdownie"
    gem.authors             = "Julio Cesar Ody"
    gem.add_dependency      'sinatra',    '>= 1.0.0'
    gem.add_dependency      'watchr',     '>= 0.6'
    gem.add_dependency      'rdiscount',  '>= 1.6.5'
    gem.add_development_dependency 'rspec', '1.3.0'
    gem.add_development_dependency 'rake',  '0.8.7'
  end
rescue LoadError
  puts 'Jeweler (or a dependency) not available. Install it with: gem install jeweler'
end