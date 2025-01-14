require 'helper'

class TestClient < Test::Unit::TestCase
  def setup
    Parse.init
  end
  
  def test_simple_save
    test_save = Parse::Object.new "TestSave"
    test_save["foo"] = "bar"
    test_save.save

    assert_equal test_save["foo"], "bar"
    assert_equal test_save[Parse::Protocol::KEY_CREATED_AT].class, String
    assert_equal test_save[Parse::Protocol::KEY_OBJECT_ID].class, String
  end
  
  def test_update
    foo = Parse::Object.new "TestSave"
    foo["age"] = 20
    foo.save
    
    assert_equal foo["age"], 20
    assert_equal foo[Parse::Protocol::KEY_UPDATED_AT], nil
    
    foo["age"] = 40
    foo.save
    
    assert_equal foo["age"], 40
    assert_equal foo[Parse::Protocol::KEY_UPDATED_AT].class, String
  end
end
