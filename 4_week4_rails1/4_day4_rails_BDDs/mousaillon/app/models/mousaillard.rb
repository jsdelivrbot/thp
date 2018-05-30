class Mousaillard < ApplicationRecord
    has_many :gossips, :dependent => :destroy
end
