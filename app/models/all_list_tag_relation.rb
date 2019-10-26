# == Schema Information
#
# Table name: all_list_tag_relations
#
#  id         :integer          not null, primary key
#  list_id    :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_all_list_tag_relations_on_list_id  (list_id)
#  index_all_list_tag_relations_on_tag_id   (tag_id)
#


class AllListTagRelation < ApplicationRecord
  belongs_to :list
  belongs_to :tag
end
