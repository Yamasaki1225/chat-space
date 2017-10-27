FactoryGirl.define do

  factory :message do
    body       { Faker::Lorem.sentence(50) }
    image      { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/images/3.JPG')) }
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    group
    user
  end

end
