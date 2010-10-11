require File.join(File.dirname(__FILE__), %w[.. lib omg])

ActiveRecord::Base.send(:include, Omg)
ActionController::Base.send(:include, Omg)

