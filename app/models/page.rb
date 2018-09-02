class Page < ApplicationRecord
    belongs_to :subject
    has_many :sections
    has_and_belongs_to_many :admin_users


    scope :visible, lambda { where(visible: true)}
    scope :invisible, lambda { where(visible: false)}
    scope :sorted, lambda { order("position ASC")}
    scope :newest_first, lambda { order("created_at DESC")}

    validates :name, 
        presence: true, 
        length: { maximum: 40 }

    validates :permalink, 
        presence: true, 
        length: { within: 3..50 }, 
        uniqueness: true
     
end
