#
# Ruby Tree Interface by Jason M. Adams.  Distributed under the BSD license:
# Copyright (c) 2008, Jason M. Adams
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
#
#     * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
#     * The name of Jason M. Adams may not be used to endorse or promote products derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#
# To use this interface, drop it in your current class with +include+.
# You must then simply implement the +parent+ and +children+ methods.
#  * +parent+ returns the parent node of the current node or else nil if it's a root
#  * +children+ returns an +Array+ of all children of this node or an empty +Array+ if it is a leaf node
#
module SimpleTree
  def parent() raise "parent must be overridden"; end
  def children() raise "children must be overridden"; end


  #
  # Return whether this node is a leaf node in the hierarchy.
  #
  def is_leaf?
    if children.size == 0
      true
    else
      false
    end
  end


  #
  # Determine whether this is the root node in the hierarchy.
  #
  def is_root?
    if parent
      false
    else
      true
    end
  end


  #
  # Determine whether the node has a parent.
  #
  def has_parent?
    not is_root?
  end


  #
  # Determine whether the node has children.
  #
  def has_children?
    not is_leaf?
  end


  #
  # Return the height of this subtree.  A single node has height 1.
  #
  def height
    heights = children.map {|child| child.height}
    return 1 if heights.size == 0
    return heights.max + 1
  end


  #
  # Return an array containing the siblings of the current node.
  #
  def siblings
    # handle case where this is the root node
    return Array.new unless parent

    sibs = Array.new
    parent.children.each do |child|
      next if child.id == self.id
      sibs << child
    end

    sibs
  end


  #
  # Return every node descending from this node's parent (except this node).
  # This include all of the node's descendants.
  #
  def family
    if parent
      fam = [parent] + parent.descendants
    else
      fam = descendants
    end

    fam.delete(self)
    fam
  end

  #
  # Return an array containing every ancestor of the current node.
  #
  def ancestors
    d = Array.new
    current = self.parent()
    d << current

    until d.include?(current.parent)
      current = current.parent
      d << current
    end

    d.flatten
  end

  #
  # Return an array containing every descendant of the current node.
  #
  def descendants
    d = Array.new

    children.each do |child|
      d << child
      d << child.descendants
    end

    d.flatten
  end


  #
  # Return the grandparent of this node.
  #
  def grandparent
    parent.parent if parent     # returns nil by default if no parent
  end


  #
  # Return all the leaf nodes having the current node as an ancestor.
  #
  def leaves
    outp = Array.new
    children.each do |child|
      if child.is_leaf?
        outp << child
      else
        outp << child.leaves
      end
    end

    outp.flatten
  end


  #
  # Helper method for to_s, returns a tree representation of the subtree
  # rooted at this node.  This assumes some sort of identifier is specified
  # for the object being called (self.name, self.identifier, etc)
  #
  def tree_rep(depth=0)
    if self.name
      ident = self.name
    elsif self.identifier
      ident = self.identifier
    else
      ident = self.object_id
    end
    if depth > 0
      outp = " #{(["    "] * (depth - 1)).join("|")}\\- #{ident}\n"
    else
      outp = "#{ident}\n"
    end
    children.each do |child|
      outp += child.tree_rep(depth + 1)
    end
    outp
  end

end
