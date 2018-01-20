class Entry < ActiveRecord::Base
    belongs_to :user
    has_many :subentries

    accepts_nested_attributes_for :subentries
end
