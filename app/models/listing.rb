class Listing < ActiveRecord::Base
	if Rails.env.development?

has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg"
else

has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg",

:storage => :dropbox,
:dropbox_credentials => Rails.root.join("config/dropbox.yml")
end
validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png),
:path => ":style/:id_:filename"
validates :name, :price, :description, presence: true
validates :price, numericality: { greater_than: 0}

belongs_to :user

end