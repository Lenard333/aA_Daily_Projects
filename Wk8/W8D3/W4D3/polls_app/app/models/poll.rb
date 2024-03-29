# == Schema Information
#
# Table name: polls
#
#  id         :bigint           not null, primary key
#  title      :string
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Poll < ApplicationRecord
   belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :user

   has_many :questions,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :questions

end
