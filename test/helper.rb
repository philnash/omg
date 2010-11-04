require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'flexmock/test_unit'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'omg'

class Test::Unit::TestCase
end