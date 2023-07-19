require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
	test 'render a list of products' do
		get products_path
		assert_response :success
		assert_select '.product', 2
	end

	test 'render a detailed products page' do
		get products_path(products(:ps4))
		assert_response :success
# 		assert_not_empty 'products', 'No hay'
#  		assert_empty 'products_path'

#		assert_select '.title', 'PS4 Fat'
# 		assert_select '.description', 'PS4 como nuevo'
#		assert_select '.price', '150'
	end

end	