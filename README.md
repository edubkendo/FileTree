# FileTree

A simple tree structure for working with FilePath objects in ruby. I simply took the simple_tree module from https://github.com/ealdent/simple-tree and hacked it into [Pathname](http://www.ruby-doc.org/stdlib-2.0/libdoc/pathname/rdoc/Pathname.html) from the std-lib. This means you get all the awesome features of working with Pathname, as well as making it easy to examine a filepath's ancestors and descendants.

# Usage

## Install

install with: `gem install filetree`

## Examples

```ruby

    require "filetree"

    tree = FileTree.new('/home/user/test/test1/test2')
    # => #<FileTree:/home/user/test/test1/test2>

    tree.parent
    # => #<FileTree:/home/user/test/test1>

    tree.ancestors
    # => [#<FileTree:/home/user/test>,
    #     #<FileTree:/home/user>,
    #     #<FileTree:/home>,
    #     #<FileTree:/>]

    tree.descendants
    # => [#<FileTree:/home/user/test/test1/test2/testee>,
    #     #<FileTree:/home/user/test/test1/test2/testee/testeggg>,
    #     #<FileTree:/home/user/test/test1/test2/testee/testeggg/test4>,
    #     #<FileTree:/home/user/test/test1/test2/testee/testeggg/test4/myfile.txt>,
    #     #<FileTree:/home/user/test/test1/test2/testee/testeggg/test3>,
    #     #<FileTree:/home/user/test/test1/test2/testee/testeggg/test3/no>,
    #     #<FileTree:/home/user/test/test1/test2/testee/test4>,
    #     #<FileTree:/home/user/test/test1/test2/testee/test4/myfile.txt>,
    #     #<FileTree:/home/user/test/test1/test2/testee/test3>,
    #     #<FileTree:/home/user/test/test1/test2/testee/test3/no>]

    des_arr = tree.descendants.map { |e| FileTree.new(e.relative_path_from(FileTree.new('/home/user'))) }
    # => [#<FileTree:test/test1/test2/testee>,
    #     #<FileTree:test/test1/test2/testee/testeggg>,
    #     #<FileTree:test/test1/test2/testee/testeggg/test4>,
    #     #<FileTree:test/test1/test2/testee/testeggg/test4/myfile.txt>,
    #     #<FileTree:test/test1/test2/testee/testeggg/test3>,
    #     #<FileTree:test/test1/test2/testee/testeggg/test3/no>,
    #     #<FileTree:test/test1/test2/testee/test4>,
    #     #<FileTree:test/test1/test2/testee/test4/myfile.txt>,
    #     #<FileTree:test/test1/test2/testee/test3>,
    #     #<FileTree:test/test1/test2/testee/test3/no>]

    des_arr.first
    # => #<FileTree:test/test1/test2/testee>

    des_arr.last.ancestors # infinite loop. "ancestors" depends on hitting "/" to stop.

    # the "tree_rep" method provides prettyprinting for creating your own to_s methods
    puts tree.tree_rep
    # => nil

    # >> #<FileTree:/home/user/test/test1/test2>
    # >>  \- #<FileTree:/home/user/test/test1/test2/testee>
    # >>      \- #<FileTree:/home/user/test/test1/test2/testee/testeggg>
    # >>      |    \- #<FileTree:/home/user/test/test1/test2/testee/testeggg/test4>
    # >>      |    |    \- #<FileTree:/home/user/test/test1/test2/testee/testeggg/test4/myfile.txt>
    # >>      |    \- #<FileTree:/home/user/test/test1/test2/testee/testeggg/test3>
    # >>      |    |    \- #<FileTree:/home/user/test/test1/test2/testee/testeggg/test3/no>
    # >>      \- #<FileTree:/home/user/test/test1/test2/testee/test4>
    # >>      |    \- #<FileTree:/home/user/test/test1/test2/testee/test4/myfile.txt>
    # >>      \- #<FileTree:/home/user/test/test1/test2/testee/test3>
    # >>      |    \- #<FileTree:/home/user/test/test1/test2/testee/test3/no>

```
# Documentation

View the [docs](http://rubydoc.info/gems/filetree).

# Credits

All credit belongs to the following persons, I just cobbled this together from their work:

- [@ealdent](https://github.com/ealdent/simple-tree)
- The authors and maintainers of [Pathname](http://www.ruby-doc.org/stdlib-2.0/libdoc/pathname/rdoc/Pathname.html)

# License

Distributed under the BSD license, please see [LICENSE](https://github.com/edubkendo/FileTree/blob/master/LICENSE) for more information.