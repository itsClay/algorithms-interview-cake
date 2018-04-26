# Write a function to see if a binary tree ↴ is "superbalanced" 
# (a new tree property we just made up).

# A tree is "superbalanced" if the difference between the depths 
# of any two leaf nodes ↴ is no greater than one.

class BinaryTreeNode
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def self.insert_left(value)
    @left = new BinaryTreeNode(value)
    @left
  end

  def self.insert_right(value)
    @right = new BinaryTreeNode(value)
    @right
  end
end

# difference between the min leaf depth and max leaf depth is <= 1
# must be at least 2 distinct leaf depths and at most 1 apart

def is_superbalanced?(root_tree)
  return true if !root_tree # tree with no nodes
  depths = []
  nodes = []
  nodes. << [root_tree, 0] # init with the root if we have leaves

  while nodes.length > 0
    node_pair = nodes.pop

    node = node_pair[0]
    depth = node_pair[1]

    # no children
    if (!node.left && !node.right)
      if depths.index(depth) < 0
        depths.push(depth)
        if depths.length > 2 || 
           ( depths.length == 2 && Math.abs(depths[0] - depths[1]) > 1 )
           return false
        end
      end
    # at least 1 child
    else
      if node.left
        nodes.push([node.left, depth + 1])
      end
      if node.right
        nodes.push([node.right, depth + 1])
      end
    end
  end
  return true
end