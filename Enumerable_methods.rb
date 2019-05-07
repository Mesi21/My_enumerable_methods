module Enumerable
  def my_each
    k = 0
    until k == self.length
      yield(self[k])
      k += 1
    end
    self
  end 

  def my_each_with_index
    l = self.length-1
    for k in 0..l do
      yield(self[k], k)
    end
    self
  end 

  def my_select
    arr = []
    self.my_each do |k| 
      if yield(k)
        arr.push(k)
      end
    end
    arr
  end 

  def my_all?
    k = 0
    while k < self.length
      if !yield (self[k])
        return false
      end
      k += 1
    end
    true
  end 

  def my_any?
    k = 0
    while k < self.length
      if yield self[k]
        return true
      end
      k += 1
    end
    false
  end 

  def my_none?
    k = 0
    while k < self.length
      if yield self[k]
        return false
      end
      k += 1
    end
    true
  end

  def my_count
    k = 0
    c = 0
    while k < self.length
      if block_given?
        if yield self[k]
          c += 1
        end
      else
        c += 1
      end
      k += 1
    end
    c
  end 

  def my_map
    new_array = []
    self.my_each{|element| new_array << element if yield(element)}
    new_array
  end 

  def my_inject(v=nil)
    v=0 if v.nil? 
    self.my_each do |k|
      v = yield(v, k)
    end
    v
  end
end

def multiply_els(ar)
  ar.my_inject(1) { |sum, k| sum * k }
end

#[1,2,3].my_each{|i| puts i}
#[1,2,3].my_each_with_index{|i, value| puts "#{i} #{value}"}
#puts [1,2,3].my_select{|i|  i>=2}
#puts [1,2,3].my_all?{|i|  i>2}
#puts [1,2,3].my_any?{|i| i>4}
#puts [1,2,3].my_none?{|i|  i>2}
#puts [1,2,3,4].my_count{|i| i>=2}
#puts [1,2,3,4].my_map{|i| i>2}
puts multiply_els([5,2,3,4])
