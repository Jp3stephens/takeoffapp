class CalculationsController < ApplicationController
    before_action :set_material, only: [:create, :finish]
  
    def create
      @calculation = Calculation.new(calculation_params)
      @calculation.material_id = params[:material_id]
  
      if @calculation.valid?
        @calculation.amount_needed = calculate_amount_needed(@calculation.square_footage.to_i, @material.unit_size.to_i)
        @calculation.total_price = calculate_total_price(@calculation.amount_needed, @material.unit_price)
      end
  
      render 'materials/show'
    end
  
    def finish
      # Save the calculated result to your database or perform any necessary actions
      # For simplicity, the example below just renders a message with the calculated total cost.
    #   @total_cost = Calculation.total_cost
      @total_cost = 3232323
      render 'materials/show'
    end
  
    private
  
    def set_material
      @material = Material.find(params[:material_id])
    end
  
    def calculation_params
      params.require(:calculation).permit(:material_id, :square_footage)
    end
  
    def calculate_amount_needed(square_footage, unit_size)
      square_footage.to_i / unit_size.to_i
    end
  
    def calculate_total_price(amount_needed, unit_price)
      amount_needed * unit_price
    end
  end
  