class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @options = ['Sandwiches', 'Sides', 'Mexican', 'Pizza']
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @options = ['Sandwiches', 'Sides', 'Mexican', 'Pizza']
  end

  def check_admin
    if !user_signed_in?
      redirect_to root_url, alert: "Uh oh! Looks like you need to log in to proceed."
    elsif !current_user.admin?
      redirect_to root_url, alert: "Sorry, you do not have permission to do that."
    end
  end

  # GET /products/1/edit
  def edit
    @options = ['Sandwiches', 'Sides', 'Mexican', 'Pizza']
  end

  # POST /products
  # POST /products.json
  def create
    @options = ['Sandwiches', 'Sides', 'Mexican', 'Pizza']
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @options = ['Sandwiches', 'Sides', 'Mexican', 'Pizza']
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :category, :image, :stock)
    end
end
