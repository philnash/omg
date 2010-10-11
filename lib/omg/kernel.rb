module Kernel
private
   def omg_method
     caller[1][/`([^']*)'/, 1]
   end
end
