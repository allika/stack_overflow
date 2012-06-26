# == Schema Information
#
# Table name: tags
#
#  id          :integer(4)      not null, primary key
#  user_id     :integer(4)
#  name        :string(255)     default(""), not null
#  description :text
#  popularity  :integer(4)      default(0), not null
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

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

  def self.not_attached_to_comment(comment_id)
    @used_tags_ids = Comment.find_by_id(comment_id).tags.collect{|tag| tag.id }
    @tags_available = []
    Tag.all.each do |tag|
      @tags_available << tag unless @used_tags_ids.include? tag.id
    end
    @tags_available
  end
end
