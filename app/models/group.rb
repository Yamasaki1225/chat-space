class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users

  validates :name, presence: true

  # # def add_error_group
  # #   if name.empty?
  # #   erros(:name "グループ名入力してください")
  #   end
  # end
end
