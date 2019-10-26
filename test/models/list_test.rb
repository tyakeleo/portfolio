# == Schema Information
#
# Table name: lists
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  title          :string(255)
#  image          :string(255)
#  image_url      :string(255)
#  product_image  :string(255)
#  product_url    :string(255)
#  product_name   :string(255)
#  product_review :string(255)
#  rate           :float(24)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#


require 'test_helper'

class ListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
