class AddAndChangeSomeProductionFields < ActiveRecord::Migration
  def up
  	rename_column("products", "name", "title")
  	add_column("products", "release_year", :integer)
  	add_column("products", "description", :text)
  	add_column("products", "imdb_id", :string)
  	add_column("products", "poster_url", :string)
  end

  def down
  	remove_column("products", "poster_url")
  	remove_column("products", "imdb_id")
  	remove_column("products", "description")
  	remove_column("products", "release_year")
  	rename_column("products", "title", "name" )
  end
end
