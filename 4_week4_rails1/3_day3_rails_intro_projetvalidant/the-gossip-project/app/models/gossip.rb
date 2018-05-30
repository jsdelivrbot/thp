class Gossip < ApplicationRecord
    validates :anonymous_author, presence: true,
                    length: { minimum: 2 }
    validates :content, presence: true,
                length: { minimum: 4 }
end
