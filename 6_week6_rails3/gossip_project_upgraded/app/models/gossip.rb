class Gossip < ApplicationRecord
    belongs_to :mousaillon, foreign_key: :mousaillon_id
    has_and_belongs_to_many :likers, :class_name => 'Mousaillon', :join_table => :gossips_mousaillons

    validates :title, on: :create, presence: true
    validates :content, on: :create, presence: true

end
