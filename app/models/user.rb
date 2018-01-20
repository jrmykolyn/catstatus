class User < ActiveRecord::Base
    has_many :cats
    has_many :entries
end
