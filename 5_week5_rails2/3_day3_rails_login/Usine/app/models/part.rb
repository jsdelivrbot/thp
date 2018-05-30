class Part < ApplicationRecord
    has_many :assemblies_parts
    has_many :assemblies, through: :assemblies_parts
end
 