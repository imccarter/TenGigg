class RenamePwDigest < ActiveRecord::Migration
  def change
    rename_column(:users, :pw_digest, :password_digest)
  end
end
