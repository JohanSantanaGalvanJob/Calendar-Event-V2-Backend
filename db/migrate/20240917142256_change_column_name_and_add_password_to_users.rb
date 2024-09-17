class ChangeColumnNameAndAddPasswordToUsers < ActiveRecord::Migration[7.2]
  def change

    # Cambiar el nombre de la columna "birtdate" a "birthdate"
    rename_column :users, :birtdate, :birthdate

    # Agregar una columna "password_digest" a la tabla "users"
    add_column :users, :password_digest, :string

  end
end
