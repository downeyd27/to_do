class Task < ActiveRecord::Base
  belongs_to :list
  validates :description, presence: true, length: { maximum: 50 }

  before_save :downcase

private

  def downcase
    self.description = description.downcase!
  end
end
