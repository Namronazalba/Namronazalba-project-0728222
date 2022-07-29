class Post < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :address
  validates_presence_of :generate_short_url

  belongs_to :user
  belongs_to :category
  has_many :comments

  mount_uploader :image, ImageUploader

  def generate_short_url
    loop do
      @surl = rand(1..9998).to_s.rjust(4,'0')
      break unless Post.exists?(url_short: @surl)
    end
    self.url_short = @surl
  end
end

