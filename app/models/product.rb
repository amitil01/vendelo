class Product < ApplicationRecord
	include Favoritable

	ORDER_BY = {
		recientes: "created_at DESC",
        caros: "price DESC", 
        baratos: "price ASC"
    }

	has_one_attached :photo

#	has_many_attached - Multiples fotos
	
	validates :title, presence: true
	validates :description, presence: true
	validates :price, presence: true

	belongs_to :category
	belongs_to :user, default: -> {Current.user}

#   Metodos de instancia
	def owner?
		user_id == Current.user&.id
	end

	def broadcast
		broadcast_replace_to self, partial: 'products/product_details', locals: { peoduct: self} 
	end

end
