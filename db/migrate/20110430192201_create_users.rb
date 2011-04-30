class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :nickname
      t.string :name
      t.string :location
      t.string :image_twitter
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end

