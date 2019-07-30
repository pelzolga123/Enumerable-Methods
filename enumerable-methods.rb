module Enumerable
    def my_each
        i = 0
        while i < self.length
          yield(self[i])   
            i+=1   
        end 
    end

    def my_each_with_index
        i = 0
        while i < self.length
          yield(self[i], i)   
            i+=1   
        end 
    end

    def my_select
        arr = []
        self.my_each{ |e|
        if yield(e)
             arr.push(e) 
        end
        }
       arr   
    end

    def my_all? 
        self.my_each{|e|
        if !yield e
            return false
        end    
        }
        return true
    end

    def my_any?
        self.my_each{|e|
        if yield e
            return true
        else 
            return false
        end    
        }
    end

    def my_none?
        self.my_each{|e|
        if yield e
            return false
        end    
        }
        return true
    end

    def my_count
        i = 0
        self.my_each{
            i+=1   
    }
        return i
    end

    def my_map(proc=nil)
        
        arr = []
        if proc != nil 
        self.my_each{ |e|
         arr.push(proc.call e) 
        }
        else
        self.my_each{ |e|
         arr.push(yield(e)) 
        }
        end
      arr 
    end

    def my_inject(value)
        self.my_each{|e| 
        value = yield(value, e)
    }
    value
    end  

  end

  def multiply_els(arr)
    arr.my_inject(1){|total, element| total * element}
  end

  proc = Proc.new do |e| 
    e * 3
  end

  