require 'singleton'
module Omg
  def omg!(*args)
    logger = OmgLogger.instance
    text = "\n"
    text << "~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
    text << "OMG!\n"
    if args.length > 0
      args.each do |arg|
        text << "#{arg.inspect}\n"
      end
    else
      text << "#{caller[0][/`([^']*)'/, 1]} called!\n"
    end
    text << "~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
    text << "\n"
    logger.log(text)
  end
end

Object.send(:include, Omg)

class OmgLogger
  include Singleton
  attr_accessor :logger, :method
  def log_with(logger, method)
    @logger = logger
    @method = method
  end
  
  def log(str)
    if @logger && @method
      @logger.send(@method.to_sym, str)
    elsif defined?(Rails) && Rails.logger
      if @method
        Rails.logger.send(@method.to_sym, str)
      else
        Rails.logger.debug(str)
      end
    else
      $stdout.puts(str)
    end
  end
end