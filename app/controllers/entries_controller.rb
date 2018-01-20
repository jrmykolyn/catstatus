class EntriesController < ApplicationController
    before_action :authenticate_user!, { :only => [ :new ] }
    before_action :user_can_create_entry?, { :only => [ :new ] }

    def index
        @statuses = Status.all
    end

    def new
        @user = current_user
        @entry = Entry.new
        @statuses = Status.all
    end

    def create
        @entry = Entry.new( entry_params( params ) )
        @entry.user_id = current_user.id
        @statuses = Status.all # /// TEMP: Required due to possibility that `new` view will be rendered without passing through `#new` method.

        if @entry.save
            redirect_to entries_path
        else
            render :new
        end
    end

    def user_can_create_entry?
        unless current_user.can_create_entry?
            redirect_to entries_path
        end
    end

    private
    def entry_params( params )
        return params.require( :entry ).permit( subentries_attributes: [ :status_id, :cat_id ] )
    end
end
