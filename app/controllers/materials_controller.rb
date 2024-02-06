class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :edit, :update, :destroy]

  # GET /materials
  def index
    @pagy, @materials = pagy(Material.sort_by_params(params[:sort], sort_direction))

    # Uncomment to authorize with Pundit
    # authorize @materials
  end

  # GET /materials/1 or /materials/1.json
  def show
    @calculation = Calculation.new
  end

  # GET /materials/new
  def new
    @material = Material.new

    # Uncomment to authorize with Pundit
    # authorize @material
  end

  # GET /materials/1/edit
  def edit
  end

  # POST /materials or /materials.json
  def create
    @material = Material.new(material_params)

    # Uncomment to authorize with Pundit
    # authorize @material

    respond_to do |format|
      if @material.save
        format.html { redirect_to @material, notice: "Material was successfully created." }
        format.json { render :show, status: :created, location: @material }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materials/1 or /materials/1.json
  def update
    respond_to do |format|
      if @material.update(material_params)
        format.html { redirect_to @material, notice: "Material was successfully updated." }
        format.json { render :show, status: :ok, location: @material }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materials/1 or /materials/1.json
  def destroy
    @material.destroy!
    respond_to do |format|
      format.html { redirect_to materials_url, status: :see_other, notice: "Material was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_material
    @material = Material.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @material
  rescue ActiveRecord::RecordNotFound
    redirect_to materials_path
  end

  # Only allow a list of trusted parameters through.
  def material_params
    params.require(:material).permit(:name, :unit_size, :unit_price)

    # Uncomment to use Pundit permitted attributes
    # params.require(:material).permit(policy(@material).permitted_attributes)
  end
end
