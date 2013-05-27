require "filetree"

tree = FileTree.new('/home/eric/test/test1/test2')
# => #<FileTree:/home/eric/test/test1/test2>

tree.parent
# => #<FileTree:/home/eric/test/test1>

tree.ancestors
# => [#<FileTree:/home/eric/test>,
#     #<FileTree:/home/eric>,
#     #<FileTree:/home>, # !> method redefined; discarding old name
#     #<FileTree:/>]

tree.descendants
# => [#<FileTree:/home/eric/test/test1/test2/testee>, # !> method redefined; discarding old id
#     #<FileTree:/home/eric/test/test1/test2/testee/testeggg>,
#     #<FileTree:/home/eric/test/test1/test2/testee/testeggg/test4>,
#     #<FileTree:/home/eric/test/test1/test2/testee/testeggg/test4/myfile.txt>,
#     #<FileTree:/home/eric/test/test1/test2/testee/testeggg/test3>, # !> method redefined; discarding old identifier
#     #<FileTree:/home/eric/test/test1/test2/testee/testeggg/test3/no>,
#     #<FileTree:/home/eric/test/test1/test2/testee/test4>,
#     #<FileTree:/home/eric/test/test1/test2/testee/test4/myfile.txt>,
#     #<FileTree:/home/eric/test/test1/test2/testee/test3>,
#     #<FileTree:/home/eric/test/test1/test2/testee/test3/no>]

des_arr = tree.descendants.map { |e| FileTree.new(e.relative_path_from(FileTree.new('/home/eric'))) }
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

# >> #<FileTree:/home/eric/test/test1/test2>
# >>  \- #<FileTree:/home/eric/test/test1/test2/testee>
# >>      \- #<FileTree:/home/eric/test/test1/test2/testee/testeggg>
# >>      |    \- #<FileTree:/home/eric/test/test1/test2/testee/testeggg/test4>
# >>      |    |    \- #<FileTree:/home/eric/test/test1/test2/testee/testeggg/test4/myfile.txt>
# >>      |    \- #<FileTree:/home/eric/test/test1/test2/testee/testeggg/test3>
# >>      |    |    \- #<FileTree:/home/eric/test/test1/test2/testee/testeggg/test3/no>
# >>      \- #<FileTree:/home/eric/test/test1/test2/testee/test4>
# >>      |    \- #<FileTree:/home/eric/test/test1/test2/testee/test4/myfile.txt>
# >>      \- #<FileTree:/home/eric/test/test1/test2/testee/test3>
# >>      |    \- #<FileTree:/home/eric/test/test1/test2/testee/test3/no>
