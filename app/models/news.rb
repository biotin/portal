class News < ActiveRecord::Base
 validates :title, :description, presence: true
 def self.search(search)
  if search
   where('description ||title LIKE?', "%#{search}%")
  else
   scoped
  end
 end
end
