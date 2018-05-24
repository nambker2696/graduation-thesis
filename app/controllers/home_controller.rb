class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_cart
  # before_action :force_json, only: :search 
  before_action :set_locale

  # skip_before_action :set_cart
  # skip_before_action :get_category
  # skip_before_action :get_city_district
  # skip_before_action :get_num_cart_item
  def index
    @dishs =  Dish.all.page params[:page]
  end

  def search
    byebug
    # str = escape_characters_in_string(params[:q])
    types_cate = params[:types].present? ? params[:types] : nil
    @ql = params[:ql].present? ? params[:ql] : nil
    @locations = Array.new
    if types_cate != nil
      types_ids = types_cate.first.split(',')
      types_ids.each do |tp|
        cate_id = Category.find_by slug_cate: tp
        @location = Location.joins(:category).where("category_id"=> cate_id.id).joins(:dishes).ransack(name_cont: params[:q]).result(distinct: true)
        @location.each do |lc|
          @locations << lc
        end
      end

        # @locations = Kaminari.paginate_array(@locations).page(params[:page]).per(5)
      else
        # @locations = Location.joins(:dishes).ransack(name_cont: params[:q]).result(distinct: true)
      @locations = Location.joins(:dishes).ransack(name_cont: params[:q]).result(distinct: true).page params[:page]
    end
    # @users = Array.new
    @dishes = Array.new
    @reviews = Array.new
    @locations.each do | lct|
    #   # @user = User.joins(:location).where("locations.id=?",lct.id)
    @dish = Dish.where(location_id: lct.id).count
    @review = Review.where(location_id: lct.id).count
    #   # @users << @user
    @dishes << @dish
    @reviews << @review
    end

    respond_to do |format| 
      format.html {}
      format.json {
        render json: {
          locations: @locations.as_json,
          # users: @users.as_json,
          dishes: @dishes.as_json,
          reviews: @reviews.as_json,
        }
      }
    end
  end

  def get_location
    @locations = Location.ransack(name_cont: params[:q]).result(distinct: true)
    respond_to do |format|
      format.html {}
      format.json {
        @locations = @locations.limit(10)
      }
    end
  end
  
  def chef_signup
  end

  def create_chef
    User.create(:email => params[:email],:password =>params[:password],:admin => true)
    redirect_to admin_admin_url

  end

  def about; end

  def contact; end 

  private
   # def force_json 
   #      request.format = :json 
   #  end 
  # def escape_characters_in_string(string)
  #   pattern = /(\'|\"|\.|\*|\/|\-|\+|\]|\[|\)|\(|\\)/
  #   string.gsub(pattern){|match|"\\"  + match}
  # end
end
