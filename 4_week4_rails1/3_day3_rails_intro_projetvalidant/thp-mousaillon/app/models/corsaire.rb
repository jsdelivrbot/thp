class Corsaire < ApplicationRecord
    validates :first_name, presence: true,
                    length: { maximum: 20 }
    validates :age, presence: true,
                numericality: { greater_than: 15, less_than_or_equal_to: 120,  only_integer: true }
    validates :slack_handle, format: { without: /\s/ }
    validates :github_handle, format: { without: /\s/ }
end
