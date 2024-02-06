class Calculation
    include ActiveModel::Model
    attr_accessor :material_id, :square_footage, :amount_needed, :total_price
  
    validates :material_id, presence: true
    validates :square_footage, presence: true, numericality: { greater_than: 0 }
end
  