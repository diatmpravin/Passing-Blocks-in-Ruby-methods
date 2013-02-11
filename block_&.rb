
# def test
#    yield 5,10
#    puts "You are in the method test"
#    yield 100,200
# end

# def test
#    yield 
#    puts "You are in the method test"
#    yield 
# end


# def test(b=Proc.new)
#    # p b	
#    b.call(10,20)
#    puts "You are in the method test"
#    yield 100,200
# end

#The & calls 'to_proc' on the object, and passes it as a block to the method
#In Rails, to_proc is implemented on Symbol, so that these two calls are equivalent:
#something {|i| i.foo }
#something(&:foo)
def test(&b)
   p b	
   b.call(10,20)
   puts "You are in the method test"
   yield 100,200
end

# test {|i,j| puts "You are in the block"}
test {|i,j| puts "You are in the block #{i} and #{j}"}
