class ProductsController < ApplicationController
  def index
    @categories = Category.order(id: :asc).load_async    
    @pagy, @products = pagy_countless(FindProducts.new.call(product_params_index).load_async, items: 6)     
  end

  def show
    product
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path, notice: 'Producto guardado!'
    else
      render :new, status: :unprocessable_entity 
    end

  end

  def edit
    authorize! product
    product
  end

  def update
    authorize! product
    if product.update(product_params)
      product.broadcast
      redirect_to products_path, notice: 'Producto Actualizado!'
    else
      render :edit, status: :unprocessable_entity 
    end

  end

  def destroy
    authorize! product
    product.destroy
    redirect_to products_path, notice: 'Producto Eliminado!', status: :see_other    
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :photo, :category_id)
  end

  def product_params_index
    params.permit(:category_id, :min_price, :max_price, :order_by, :page, :favorites, :user_id) 
  end

  def product
    @product ||= Product.find(params[:id])
  end

end