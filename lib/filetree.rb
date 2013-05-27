require "pathname"
require "filetree/simple_tree"

class Pathname
  alias :_parent :parent
  alias :_children :children
end

class FileTree < Pathname
  include SimpleTree

  attr_accessor :name, :id, :identifier

  def name
    @name ||= self.inspect
  end

  def id
    @id ||= self.inspect
  end

  def identifier
    @identifier ||= self.inspect
  end

  # See Pathname#parent

  def parent
    FileTree.new(_parent)
  end

  # See Pathname#children

  def children(*args)
    if self.directory?
      _children(*args)
    else
      []
    end
  end

end