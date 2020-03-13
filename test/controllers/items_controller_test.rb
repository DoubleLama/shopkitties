require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
  test "should get index" do
    get items_index_url
=======
  test "should get show" do
    get items_show_url
>>>>>>> eed59de4e808a0c7f701573cded9ed62d3c8a211
    assert_response :success
  end

end
