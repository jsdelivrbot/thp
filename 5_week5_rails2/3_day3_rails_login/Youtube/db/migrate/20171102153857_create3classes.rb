class Create3classes < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
        t.string :name
        t.string :avatar
    end

    create_table :videos do |t|
        t.string :name
        t.belongs_to :category, index: true
        t.belongs_to :user, index: true
    end

    create_table :categories do |t|
        t.string :name
    end

    create_table :categories_users, id: false do |t|
        t.belongs_to :category, index: true
        t.belongs_to :user, index: true
    end
  end
end
