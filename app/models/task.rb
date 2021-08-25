class Task < ApplicationRecord
 
    validates :title, presence: true
    validates :content, presence: true

    scope :search_status, -> (status) { where(status: status) }
    scope :search_title, -> (title) { where("title LIKE ?", "%#{title}%") }
    
    enum priority:{ 高: 0, 中: 1, 低: 2 }
    enum status:{  未着手: 0, 着手中: 1, 完了: 2 }
	


end
