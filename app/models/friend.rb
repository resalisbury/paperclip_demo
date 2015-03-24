class Friend < ActiveRecord::Base
  validates :name, presence: true
  validates :avatar,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
    attachment_size: { less_than: 5.megabytes }

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  },
    :storage => :s3,
    :s3_host_name => 's3-us-west-1.amazonaws.com',
    :s3_protocol => 'http',
    :s3_credentials => "#{Rails.root}/config/s3.yml"
end
