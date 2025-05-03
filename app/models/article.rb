class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  # validates :title, :text, presence: true

  # validates :gender_id, numericality: { other_than: 1 , message: "can't be blank"}

end
