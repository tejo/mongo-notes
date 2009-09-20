class Category
  include MongoMapper::Document

  key :name, String, :required => true
  timestamps! # HECK YES

  many :notes
end

class Note
  include MongoMapper::Document
  
  key :name, String, :required => true
  key :body
  key :category_id, String
  timestamps! # HECK YES
  
  belongs_to :category
end