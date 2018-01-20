class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :cats
    has_many :entries

    def can_create_entry?
        self.entries.where( 'created_at > ?', Time.now.beginning_of_day ).length == 0
    end
end
