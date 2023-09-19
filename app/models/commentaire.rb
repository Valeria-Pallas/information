class Commentaire < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :name, presence: true, uniqueness: { scope: :article_id }
end
