class Subentry < ActiveRecord::Base
    belongs_to :cat
    belongs_to :entry
    belongs_to :status

    validates :status_id, :cat_id, { :presence => true }
end
