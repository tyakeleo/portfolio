# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  list_id    :integer
#  name       :string(255)      not null
#  comment    :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_comments_on_list_id  (list_id)
#


class Comment < ApplicationRecord
  # コメントは一つのlistに紐づくから単数形
  belongs_to :list

  validates :name, presence: true, length: { maximum: 10}
  validates :comment, presence: true, length: { maximum: 300}
end
