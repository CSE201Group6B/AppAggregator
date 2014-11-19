class AddTableApps < ActiveRecord::Migration
  def self.up
    create_table :apps do |t|
      t.column :name, :string
      t.column :developer, :string
      t.column :price, :decimal
      t.column :link, :string
      
      t.timestamps
      
    end
  end
  def self.down
    drop_table :apps
    
  end
  
  def self.up
    create_table :users do |t|
      t.column :username, :string
      t.column :password, :string
      t.column :permissions, :integer #0 for administrator, 1 for moderator, 2 for normal user
      
      t.timestamps
      
    end
  end
  def self.down
    drop_table :users
    
  end
  
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
