# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  image           :string(255)
#  age             :string(255)
#  gender          :string(255)
#  myprofile       :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#

class User < ApplicationRecord
    has_secure_password

    has_many :relationships
    has_many :followings, through: :relationships, source: :follow
    has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
    has_many :followers, through: :reverse_of_relationships, source: :user

    validates :name,
        presence: true,
        uniqueness: true,
        length: { maximum: 16 },
        format: {
            with: /\A[a-z0-9]+\z/,
            message: 'は小文字英数字で入力してください'
        }
    validates :password,
        length: { minimum: 8}
    # ImageUploaderクラスを指定
    mount_uploader :image, ImageUploader

    def follow(other_user)
        # self には user.follow(other) を実行したとき user が代入されます。
        # つまり、実行した User のインスタンスが self 。(呼び出し元のインスタンス)
        # other_user が自分自身ではないかを検証している
        unless self == other_user
            # 見つかれば Relation を返し、見つからなければ self.relationships.createで
            # フォロー関係を保存(create = new + save)することができる
            self.relationships.find_or_create_by(follow_id: other_user.id)
        end
    end

    def unfollow(other_user)
        relationship = self.relationships.find_by(follow_id: other_user.id)
        relationship.destroy if relationship
    end

    def following?(other_user)
        self.followings.include?(other_user)
    end
    
end
