lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'filetree'

Gem::Specification.new do |s|
  s.name        = 'filetree'
  s.version     = FileTree::VERSION
  s.date        = '2013-05-27'
  s.summary     = "A simple ruby library for manipulating filepaths as tree structures"
  s.description = "A simple tree structure for working with FilePath objects in ruby. I simply took the simple_tree module from https://github.com/ealdent/simple-tree and hacked it into Pathname (http://www.ruby-doc.org/stdlib-2.0/libdoc/pathname/rdoc/Pathname.html) from the std-lib. This means you get all the awesome features of working with Pathname, as well as making it easy to examine a filepath's ancestors and descendants."
  s.authors     = ["Eric West"]
  s.email       = 'esw9999@gmail.com'

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.licenses = ["BSD"]
  s.homepage    =
    'https://github.com/edubkendo/FileTree'
end
