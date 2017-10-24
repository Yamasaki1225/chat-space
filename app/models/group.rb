class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages

  validates :name, presence: true

  # # def add_error_group
  # #   if name.empty?
  # #   erros(:name "グループ名入力してください")
  #   end
  # end

  def last_message
    if self.messages.last.present?
      if self.messages.last.image.present?
        return '画像が投稿されました'
      elsif self.messages.last.body.present?
        self.messages.last.body
      end
    else
      return '投稿がありません'
    end
  end
end
