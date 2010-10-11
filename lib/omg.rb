module Omg
  def self.debug(str)
    defined?(Rails) ? Rails.logger.debug(str) : $stdout.puts(str)
  end
  
  def omg!(obj=nil)
    Omg.debug('')
    Omg.debug('~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    Omg.debug "OMG!"
    if obj
      Omg.debug obj.inspect
    else
      Omg.debug "#{omg_method} called!"
    end
    Omg.debug('~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    Omg.debug('')
  end
  
  private
  
  def omg_method
    caller[1][/`([^']*)'/, 1]
  end
end

Object.send(:include, Omg)