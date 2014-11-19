class AddTableComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.column :commentor, :string
      t.column :comment, :string
      t.column :appID, :integer
      
      t.timestamps
      
    end
  end
  def self.down
    drop_table :comments
    
  end
  
end