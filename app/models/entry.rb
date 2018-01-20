class Entry < ActiveRecord::Base
    belongs_to :user
    has_many :subentries

    validates :user_id, { :presence => true }

    accepts_nested_attributes_for :subentries
end
