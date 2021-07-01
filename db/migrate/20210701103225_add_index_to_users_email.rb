class AddIndexToUsersEmail < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :email, unique: true # Добавляем индекс к таблице юзер столбец емайл
  end
end
