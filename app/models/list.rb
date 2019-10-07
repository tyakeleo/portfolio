# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class List < ApplicationRecord
    # listに関する複数のコメントを、listモデルから取得できるようになる
    has_many :comments

    has_many :all_list_tag_relations, dependent: :delete_all
    has_many :tags, through: :all_list_tag_relations

    validates :name, presence: true, length: { maximum: 10 }
    validates :title, presence: true, length: { maximum: 30 }

end
