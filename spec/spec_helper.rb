require File.join(File.dirname(__FILE__), *%w(.. markdownie))

set :run => false

def root
  File.dirname __FILE__
end

def fixtures_path
  root + '/fixtures'
end

