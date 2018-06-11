class UsersController < ApplicationController
  def bookings

  end
  def orders

  end
  def wishlist_chefs

  end
  def rate_chefs

  end
  def address

  end  
  def password

  end
  
  def messages
      @users = User.where.not("id = ?",current_user.id).order("created_at DESC")
      @conversations = Conversation.involving(current_user).order("created_at DESC")
  end
end
