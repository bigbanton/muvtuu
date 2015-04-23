class User < ActiveRecord::Base
  #This is the base class for STI as described at http://api.rubyonrails.org/classes/ActiveRecord/Inheritance.html and
  #http://api.rubyonrails.org/classes/ActiveRecord/Base.html#class-ActiveRecord::Base-label-Single+table+inheritance
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

validates :name, presence: true

has_many :listings, dependent: :destroy
end
