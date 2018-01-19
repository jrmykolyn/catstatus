class EntriesController < ApplicationController

    def index

        @can_create_entry = Entry.where( 'created_at > ?', Time.now.beginning_of_day ).length == 0

    end

    def new
        @entry = Entry.new
        @statuses = Status.all
    end

    def create
        @entry = Entry.new( entry_params( params ) )

        if @entry.save
            redirect_to entries_path
        else
            render :new
        end
    end

    private
    def entry_params( params )
        return params.require( :entry ).permit( :status_id )
    end
end
