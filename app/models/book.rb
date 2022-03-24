# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  body       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Book < ApplicationRecord
  validates :title, {presence: true}
  validates :body, {presence: true}
  validates :body, length: { maximum: 200 }
  belongs_to :user
end
