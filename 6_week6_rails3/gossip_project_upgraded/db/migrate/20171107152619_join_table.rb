class JoinTable < ActiveRecord::Migration[5.1]
  def change
      create_table :gossips_mousaillons, id: false do |t|
      t.belongs_to :mousaillon, index: true
      t.belongs_to :gossip, index: true
    end

  end
end
