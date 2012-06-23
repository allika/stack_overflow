class Tag < ActiveRecord::Base
  attr_accessible :user_id, :name, :description, :popularity, :created_at, :updated_at

  belongs_to :user
  has_many   :tag_attachings, :dependent => :destroy
  has_many   :comments, :through => :tag_attachings

  TAG_REGEX = /^[A-Z0-9+#-.]+$/i

  before_save { |tag| tag.name = name.downcase }

  validates :name, :presence => true, :length => { :within => 2..25 }, :format => { :with => TAG_REGEX }, :uniqueness => true
  validates :description, :presence => true, :length => {:within => 15..300}

  scope :sorted, order('popularity DESC')

  def update_popularity(value)
    popularity = self.popularity + value
    self.update_attributes!(:popularity => popularity)
  end
end
