# == Schema Information
#
# Table name: statuses
#
#  id         :bigint           not null, primary key
#  text       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Status < ApplicationRecord
  validates :text, presence: true
  has_many :posts, as: :postable
end
