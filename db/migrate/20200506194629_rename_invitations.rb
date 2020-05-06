class RenameInvitations < ActiveRecord::Migration[6.0]
  def change
    rename_table :inivitations, :invitations
  end
end
