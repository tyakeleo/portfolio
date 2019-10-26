# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Tag < ApplicationRecord
    has_many :all_list_tag_relations, dependent: :delete_all
    has_many :lists, through: :all_list_tag_relations
end
