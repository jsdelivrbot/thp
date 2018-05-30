class Assembly < ApplicationRecord
    has_many :assemblies_parts
    has_many :parts, through: :assemblies_parts
end
