class Status < ActiveRecord::Base
    has_many :subentries
end
