# == Schema Information
#
# Table name: relationships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  follow_id  :integer
#  name       :string(255)
#  image      :string(255)
#  image_url  :string(255)
#  myprofile  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_relationships_on_follow_id              (follow_id)
#  index_relationships_on_user_id                (user_id)
#  index_relationships_on_user_id_and_follow_id  (user_id,follow_id) UNIQUE
#

require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
