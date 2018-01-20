class CatsController < ApplicationController
    before_action :expose_current_user

    def index
        @cats = @user.cats
    end

    def new
        @cat = Cat.new
    end

    def create
        @cat = Cat.new( cat_params( params ) )
        @cat.user_id = @user.id

        if @cat.save
            redirect_to cats_path
        else
            render :new
        end
    end

    def expose_current_user
        @user = current_user
    end

    private
    def cat_params( params )
        return params.require( :cat ).permit( :name )
    end

end
