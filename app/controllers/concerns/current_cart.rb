module CurrentCart
  private 
  # we place the set_cart() method in a CurrentCart module and place thatmodule in the 
  #app/controllers/concernsdirectory.
  #This treatment allows us to share
  #common code (even as little as a single ethod!) among controllers.
    def  set_cart
      # byebug
      @cart = Cart.find(session[:cart.id])
      rescue ActiveRecord::RecordNotFound 
        @cart= Cart.create
        session[:cart_id]=@cart.id
    end
end
