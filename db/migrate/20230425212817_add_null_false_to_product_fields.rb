class AddNullFalseToProductFields < ActiveRecord::Migration[7.0]

  def change
    change_column_null :products, :title, AddNullFalseToProductFields
    change_column_null :products, :description, AddNullFalseToProductFields
    change_column_null :products, :price, AddNullFalseToProductFields
  end

end
