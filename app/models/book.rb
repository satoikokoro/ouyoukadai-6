class Book < ApplicationRecord
  belongs_to :user
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  has_many:favorites,dependent: :destroy
  has_many:book_comments,dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where("title LIKE?", "#{word}")
    elsif search == "forward_match"
      @book = Book.where("title LIKE?", "#{word}")
    elsif search == "backward-match"
      @book = Book.where("title LIKE?", "#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?", "#{word}")
    else
      @book = Book.all
    end
  end

end
