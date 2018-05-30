class User < ApplicationRecord
    

    has_many :authored_events, :foreign_key => :creator_id, :class_name => 'Event'
    has_and_belongs_to_many :attended_events, :class_name => 'Event', :join_table => :events_users

    before_save { self.email = email.downcase }
    validates :name,  presence: true, length: { maximum: 50 }
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
