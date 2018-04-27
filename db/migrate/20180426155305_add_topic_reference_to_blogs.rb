class AddTopicReferenceToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_reference :blogs, :topic, foreign_key: true
  end
end


#When you use rails migrations, a table called schema_migrations is automatically created, which keeps track of what migrations have been applied, by storing the version number of each migration (this is the number that prefaces the migration name in the file name, ie db/migrate/_20090617111204__migration.rb). When you run rake db:migrate to migrate up, only migrations which have not been run previously (ie. their version is not contained in the table) will be run (for this reason, changing a migration that's already been executed will have no effect when running db:migrate). When migrating down, all versions found in schema_migrations that are greater than the version you are rolling back to will be undone.