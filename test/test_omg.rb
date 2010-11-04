require 'helper'

class TestOmg < Test::Unit::TestCase
  context "logging to stdout" do
    setup do
      @logger = OmgLogger.instance
      @test_object = TestClass.new
    end
    
    should "puts to stdout" do
      flexmock($stdout).should_receive(:puts).once.with('hello')
      @logger.log('hello')
    end
    
    should "put the method to stdout" do
      flexmock($stdout).should_receive(:puts).once.with( "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~\nOMG!\nwrite_method_to_log called!\n~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n")
      @test_object.write_method_to_log
    end
    
    should "put the object to stdout" do
      flexmock($stdout).should_receive(:puts).once.with("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~\nOMG!\n{:a=>\"b\"}\n~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n")
      @test_object.write_object_to_log
    end
  end
  
  context "logging to a custom logger" do
    setup do
      @test_logger = TestLogger.new
      @test_object = TestClass.new
      @logger = OmgLogger.instance
      @logger.log_with(@test_logger, :log)
    end
    
    teardown do
      @logger.method = nil
      @logger.logger = nil
    end
    
    should "log with custom method" do
      flexmock(@test_logger).should_receive(:log).once.with('hello')
      @logger.log('hello')
    end
    
    should "log the method with the custom logger method" do
      flexmock(@test_logger).should_receive(:log).once.with( "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~\nOMG!\nwrite_method_to_log called!\n~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n")
      @test_object.write_method_to_log
    end
    
    should "log the object with the custom logger method" do
      flexmock(@test_logger).should_receive(:log).once.with("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~\nOMG!\n{:a=>\"b\"}\n~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n")
      @test_object.write_object_to_log
    end
  end
end


class TestClass
  def write_method_to_log
    omg!
  end
  
  def write_object_to_log
    omg! :a => 'b'
  end
end

class TestLogger
  def log(text)
    return text
  end
end