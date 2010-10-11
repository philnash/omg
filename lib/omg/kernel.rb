module Kernel
private
   def this_method
     caller[1][/`([^']*)'/, 1]
   end
end
