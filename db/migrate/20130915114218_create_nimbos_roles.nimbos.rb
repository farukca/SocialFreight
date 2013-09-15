# This migration comes from nimbos (originally 20130915112758)
class CreateNimbosRoles < ActiveRecord::Migration
  def change
    create_table :nimbos_roles do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:nimbos_users_roles, :id => false) do |t|
      t.references :user
      t.references :role
    end

    add_index(:nimbos_roles, :name)
    add_index(:nimbos_roles, [ :name, :resource_type, :resource_id ])
    add_index(:nimbos_users_roles, [ :user_id, :role_id ])
  end
end
