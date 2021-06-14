# https://kic-yuuki.hatenablog.com/entry/2019/08/18/105914

require 'forwardable'

class DemeterTest
  extend Forwardable

  attr_reader :child
  def initialize(args)
    @child = args[:child]
    @value = args[:value]
  end

  def print
    puts @value
  end

  def_delegator :child, :print, :child_print
end

test2 = DemeterTest.new(value: 'test2')
test = DemeterTest.new(value: 'test', child: test2)


test.child_print



