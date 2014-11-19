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
  

  

  
end
