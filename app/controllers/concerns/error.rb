module Error
	extend ActiveSupport::Concern

	included do
		rescue_from ActiveRecord::RecordNotFound do
			redirect_to products_path, alert: ('No encontro registros!')
		end
	end
end