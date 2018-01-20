class UsersController < ApplicationController
  def show
      @user = User.find( params[ :id ] )
      @is_current_user = current_user && current_user.id == @user.id
  end
end
