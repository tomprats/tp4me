class Link < ApplicationRecord
  validates :uid, presence: true, uniqueness: true
  validates_format_of :url, with: /\Ahttp/, message: "should contain http(s)"

  has_many :views

  before_validation :set_uid, on: :create
  before_create :create_uid

  def self.random
    order("RANDOM()").first
  end

  private
  def refresh_uid
    self.uid = SecureRandom.hex(3)
  end

  def set_uid
    refresh_uid unless self.uid
  end

  def create_uid
    refresh_uid if Link.where(uid: self.uid).exists?
  end
end
