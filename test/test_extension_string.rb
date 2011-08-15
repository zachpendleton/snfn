require 'helper'

class TestExtensionString < Test::Unit::TestCase
def test_should_ignore_an_already_camel_cased_string
    assert_equal "MyApp", "MyApp".camel_case
  end

  def test_should_capitalize_an_all_lower_case_string
    assert_equal "Myapp", "myapp".camel_case
  end

  def test_should_camel_case_a_lower_case_string_with_underscores
    assert_equal "MyApp", "my_app".camel_case
  end

  def test_should_camel_case_a_lower_case_string_with_hyphens
    assert_equal "MyApp", "my-app".camel_case
  end

  def test_should_camel_case_an_uppercase_string_with_underscores
    assert_equal "MyApp", "MY_APP".camel_case
  end

  def test_should_camel_case_an_uppercase_string_with_hyphens
    assert_equal "MyApp", "MY-APP".camel_case
  end

  def test_should_camel_case_a_string_with_a_hyphen_preceding_a_capital_letter
    assert_equal "MyApp", "my_App".camel_case
  end

  def test_should_underscore_a_camel_cased_string
    assert_equal "my_app", "MyApp".file_name
  end

  def test_should_underscore_a_hypenated_string
    assert_equal "my_app", "my-app".file_name
  end

  def test_should_ignore_an_already_underscored_string
    assert_equal "my_app", "my_app".file_name
  end

  def test_should_underscore_a_string_with_a_hyphen_preceding_a_capital_letter
    assert_equal "my_app", "my_App".file_name
  end
end
