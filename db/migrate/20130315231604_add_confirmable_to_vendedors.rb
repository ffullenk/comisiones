class AddConfirmableToVendedors < ActiveRecord::Migration
   # Note: You can't use change, as User.update_all with fail in the down migration
  def up
    add_column :vendedors, :confirmation_token, :string
    add_column :vendedors, :confirmed_at, :datetime
    add_column :vendedors, :confirmation_sent_at, :datetime
    # add_column :vendedors, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :vendedors, :confirmation_token, :unique => true
    # User.reset_column_information # Need for some types of updates, but not for update_all.
    # To avoid a short time window between running the migration and updating all existing
    # vendedors as confirmed, do the following
    
    # All existing user accounts should be able to log in after this.
  end

  def down
    remove_column :vendedors, :confirmation_token, :confirmed_at, :confirmation_sent_at
    # remove_column :vendedors, :unconfirmed_email # Only if using reconfirmable
  end
end
