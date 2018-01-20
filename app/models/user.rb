class User < ActiveRecord::Base
    has_many :cats
    has_many :entries

    def can_create_entry?
        self.entries.where( 'created_at > ?', Time.now.beginning_of_day ).length == 0
    end
end
