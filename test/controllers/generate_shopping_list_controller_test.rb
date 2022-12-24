require 'test_helper'

class GenerateShoppingListControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get generate_shopping_list_index_url
    assert_response :success
  end
end
