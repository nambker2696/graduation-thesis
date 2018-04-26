class Admin::CategoriesController < Admin::BaseController
  before_action :set_admin_category, only: [:show, :edit, :update, :destroy]

  # GET /admin_categories
  # GET /admin_categories.json
  def index
    @admin_categories = Category.all
  end

  # GET /admin_categories/1
  # GET /admin_categories/1.json
  def show
  end

  # GET /admin_categories/new
  def new
    @admin_category = Category.new
  end

  # GET /admin_categories/1/edit
  def edit
  end

  # POST /admin_categories
  # POST /admin_categories.json
  def create
    @admin_category = Category.new(category_params)

    respond_to do |format|
      if @admin_category.save
        format.html { redirect_to @admin_category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @admin_category }
      else
        format.html { render :new }
        format.json { render json: @admin_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin_categories/1
  # PATCH/PUT /admin_categories/1.json
  def update
    respond_to do |format|
      if @admin_category.update(category_params)
        format.html { redirect_to admin_categories_url, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_categories_url }
      else
        format.html { render :edit }
        format.json { render json: @admin_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_categories/1
  # DELETE /admin_categories/1.json
  def destroy
    @admin_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_category
      @admin_category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :display_name,:sub_category)
    end
end
