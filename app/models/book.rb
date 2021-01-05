class Book < ActiveRecord::Base
  # scopeを定義
  scope :costly, -> {where("price > ?", 3000)}
  scope :written_about, -> (theme){where("name like ?", "%#{theme}%")}
  # default_scope ->{order("published_on asc")}

  belongs_to :publisher
  
  has_many :book_authors
  has_many :authors, through: :book_authors
end
