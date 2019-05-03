module Enumerable

    def my_each
        k = 0
        unless k = self.length
            yield(self[k])
            k++
        end
        self
    end 
  
    def my_each_with_index
      l=self.length-1
      for k in 0..l do
        yield(self[k] , k)
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
          if not yield self[k]
            return false
          end
          k++
        end
    true
    end 
  
    def my_any?
        k = 0
        while k < self.length
          if yield self[k]
            return true
          end
          k++
        end
    false
    end 
  
    def my_none?
        k = 0
        while k < self.length
          if yield self[k]
            return false
          end
          k++
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
          k++
        end
        c
    end 
  
    def my_map(proc = nil)
      unless proc
        self.my_each_with_index do |k, i|
          self[i] = yield(k)
        end
      else
        self.my_each_with_index do |k, i|
          self[i] = proc.call(k)
          self[i] = yield(self[i]) if block_given?
        end
      end
      self
    end 
  
    def my_inject(final=nil)
      final = self[0] if final.nil?
      self.my_each do |k|
        final = yield(final,k)
      end
      final
    end  
  end

  def multiply_els(ar)
    ar.my_inject() { |sum, k| sum * k }
  end