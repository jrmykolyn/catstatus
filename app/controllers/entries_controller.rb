class EntriesController < ApplicationController

    def index

        @can_create_entry = Entry.where( 'created_at > ?', Time.now.beginning_of_day ).length == 0

        @user = User.first # /// TEMP

    end

    def new
        @entry = Entry.new
        @statuses = Status.all
    end

    def create
        @entry = Entry.new( entry_params( params ) )
        @entry.user_id = User.first.id # /// TEMP

        if @entry.save
            redirect_to entries_path
        else
            render :new
        end
    end

    private
    def entry_params( params )
        return params.require( :entry ).permit( subentries_attributes: [ :status_id, :cat_id ] )
    end
end
