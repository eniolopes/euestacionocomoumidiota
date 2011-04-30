class CreateIdiots < ActiveRecord::Migration
  def self.up
    create_table :idiots do |t|
	t.string :description, :null => false
	t.string :location, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :idiots
  end
end
