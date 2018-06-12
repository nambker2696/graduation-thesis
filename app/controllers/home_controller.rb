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
    # str = escape_characters_in_string(params[:q])
    types = params[:types].present? ? params[:types] : nil
    booking_order = params[:booking_order].present? ? params[:booking_order] : nil
    time_order = params[:time_order] != "on" ? params[:time_order] : nil 
    time_booking = params[:time_booking] != "on" ? params[:time_booking] : nil 
    min_order = params[:min_order] != "on" ? params[:min_order] : nil 
    min_booking = params[:min_booking] != "on" ? params[:min_booking] : nil 
    star = params[:star] != 0 ? params[:star] : nil 

    @ql = params[:ql].present? ? params[:ql] : nil
    @locations = Array.new

    # Loai bo dieu kien
    locat = Location.all
    # if booking_order != nil
    #   booking_order_ids = booking_order.first.split(',')
    #   if booking_order_ids.length == 1
    #     locat = bo == "booking" ? locat.where(status_booking: true) : locat
    #     locat = bo == "order" ? locat.where(status_order: true) : locat
    #   else
    #     locat.where(status_booking: true).where(status_order: true)
    #   end
    # end

    # if time_order != nil
    # end
    # if time_booking != nil
    # end
    if min_order != nil
      locat = locat.where("min_order < ? ",min_order.to_i)
    end
    if min_booking != nil
      locat = locat.where("min_booking < ? ",min_booking)
    end
    if star != nil
      if star == 1  
        locat = locat.where("rate_avg <= ? ",1)
      else
        locat = locat.where("rate_avg >= ? AND rate_avg <= ?",star.to_i-0.5,star.to_i+0.5)
      end
    end

    if types != nil
      types_ids = types.first.split(',')
      types_ids.each do |tp|
        cate_id = Category.find_by slug_cate: tp
        @location = locat.joins(:category).where(category_id: cate_id.id).joins(:dishes).ransack(name_cont: params[:q]).result(distinct: true)
        @location.each do |lc|
          @locations << lc
        end
      end

        # @locations = Kaminari.paginate_array(@locations).page(params[:page]).per(5)
      else
        # @locations = Location.joins(:dishes).ransack(name_cont: params[:q]).result(distinct: true)
        @locations = locat.joins(:dishes).ransack(name_cont: params[:q]).result(distinct: true).page params[:page]
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

  def search_location
    @locations = Location.ransack(name_cont: params[:ql]).result(distinct: true).limit(5)
    respond_to do |format|
      format.html {}
      format.json {
        render json:{
          locations: @locations  
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
    if params[:type_chef] == "home-food"
      types_chef = 1
    elsif params[:type_chef] == "base-food"
      type_chef = 2
    elsif params[:type_chef] == "restaurant-food"
      type_chef = 3
    else
      type_chef = nil
    end

    description = params[:description].present? ? params[:description] : nil
    facebook = params[:facebook].present? ? params[:facebook] : nil
    twitter = params[:twitter].present? ? params[:twitter] : nil

    @user = User.new(
      :first_name => params[:first_name],
      :last_name => params[:last_name],
      :email => params[:email],
      :password => params[:password],
      :name => params[:name],
      :phone => params[:phone],
      :type_chef => type_chef,
      :admin => true
      )

    if verify_recaptcha(model: @user) && @user.save
      Location.create(
      :name => params[:name_res],
      :address => params[:address],
      :phone => params[:phone],
      :open_at => params[:open_at],
      :close_at => params[:close_at],
      :description => description,
      :facebook => facebook,
      :twitter => twitter,
      :user_id => @user.id,
      :category_id => params[:category_id]
      )
      redirect_to admin_admin_url
    end
  end

  def about; end

  def contact; end 

  # private
   # def force_json 
   #      request.format = :json 
   #  end 
  # def escape_characters_in_string(string)
  #   pattern = /(\'|\"|\.|\*|\/|\-|\+|\]|\[|\)|\(|\\)/
  #   string.gsub(pattern){|match|"\\"  + match}
  # end
end
