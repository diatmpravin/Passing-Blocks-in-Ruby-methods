Passing-Blocks-in-Ruby-methods
==============================
Today moving around Proc class in Ruby. I come across details about Ruby Blocks and How ruby methods receive block.

There are two way to receive blocks in Ruby methods.

##1. Yield

Ruby's yield statement gives control to a user specified block from the method's body.

    def test
       yield 5,10
       puts "You are in the method test"
       yield 100,200
    end
    
    test {|i,j| puts "You are in the block"}

OutPut:

    You are in the block
    You are in the method test
    You are in the block

Even we  can pass parameters with the yield statement.

    def test
       yield 5,10
       puts "You are in the method test"
       yield 100,200
    end
    test {|i,j| puts "You are in the block #{i} and #{j}"}

OutPut:

    You are in the block 5 and 10
    You are in the method test
    You are in the block 100 and 200

##2. Proc

If the last argument of a method is preceded by &(Object=Proc.new), then you can pass a block to this method and this block will be assigned to the last parameter. In case both * and & are present in the argument list, & should come later.

The & calls 'to_proc' on the object, and passes it as a block to the method.
In Rails, to_proc is implemented on Symbol, so that these two calls are equivalent:
something {|i| i.foo } and  something(&:foo)

    def test(b=Proc.new)   
       b.call(10,20)
       puts "You are in the method test"
       yield 100,200
    end
    
###OR
   
    def test(&b)
       p b    
       b.call(10,20)
       puts "You are in the method test"
       yield 100,200
    end
    
    test {|i,j| puts "You are in the block #{i} and #{j}"}

Output:

    You are in the block 10 and 20
    You are in the method test
    You are in the block 100 and 200

I hope, it will give sense of how ruby methods call blocks and yield.
