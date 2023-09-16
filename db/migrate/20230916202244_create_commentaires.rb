class CreateCommentaires < ActiveRecord::Migration[7.0]
  def change
    create_table :commentaires do |t|
      t.references :article, null: false, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
