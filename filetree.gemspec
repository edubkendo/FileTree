Gem::Specification.new do |s|
  s.name        = 'filetree'
  s.version     = '0.0.3'
  s.date        = '2013-05-27'
  s.summary     = "A simple ruby library for manipulating filepaths as tree structures"
  s.description = "A simple tree structure for working with FilePath objects in ruby. I simply took the simple_tree module from https://github.com/ealdent/simple-tree and hacked it into Pathname (http://www.ruby-doc.org/stdlib-2.0/libdoc/pathname/rdoc/Pathname.html) from the std-lib. This means you get all the awesome features of working with Pathname, as well as making it easy to examine a filepath's ancestors and descendants."
  s.authors     = ["Eric West"]
  s.email       = 'nick@quaran.to'
  s.files       = ["lib/filetree.rb",
                    "lib/filetree/simple_tree.rb",
                    "LICENSE",
                    "README.md",
                    "examples/simple_filetree.rb",
                    "filetree.gemspec"
                  ]
  s.licenses = ["BSD"]
  s.homepage    =
    'https://github.com/edubkendo/FileTree'
end