class Mousaillon < ApplicationRecord
 
 attr_accessor :sign_up_code
  validates :sign_up_code,
    on: :create,
    presence: true,
    inclusion: { in: ["GOSSIP2017"] }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#Relationships
   has_many :gossips
   has_and_belongs_to_many :liked_gossips, :class_name => 'Gossip', :join_table => :gossips_mousaillons

end
