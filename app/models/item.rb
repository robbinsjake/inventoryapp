class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { in: 0..999 }
  validates :quantity, presence: true, numericality:{ greater_than_or_equal_to: 0, less_than: 99999 }
  belongs_to :city
  has_many_attached :images
  validate :image_ext

  private
  def image_ext
    images.each do |image|
  	  if !image.content_type.in?(%('image/jpeg image/png image/jpg'))
  	  	errors.add(:images, 'one or more incorrect file type')
      end
    end
  end
end
