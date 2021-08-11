# Reverses the contents of a String or IO object.
#
# @param contents [String, #read] the contents to reverse
# @return [String] the contents reversed lexically
def reverse(contents)
  contents = contents.read if contents.respond_to? :read
  contents.reverse
end
