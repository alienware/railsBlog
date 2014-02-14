class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
			t.references :post
			#t.references :user
			t.integer :stars
      t.timestamps
		end
		add_index :ratings, :post_id
		#add_index :ratings, :user_id
  end
end
