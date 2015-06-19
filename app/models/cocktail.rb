class Cocktail < ActiveRecord::Base
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: true
  has_attached_file :picture,
    styles: { medium: "226x206>", thumb: "100x100>", large: "300x300>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end
