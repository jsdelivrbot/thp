class CreateAssembliesParts < ActiveRecord::Migration[5.1]
  def change
    create_table :assemblies_parts do |t|
      t.integer :part_id
      t.integer :assembly_id

      t.timestamps
    end
  end
end
