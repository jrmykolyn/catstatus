class Entry < ActiveRecord::Base
    belongs_to :cat
    belongs_to :status
end
