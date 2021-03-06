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
        @cat.image_url = "https://robohash.org/#{Time.now.to_i}.png?set=set4&size=150x150"

        if @cat.save
            redirect_to user_path( @user )
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
