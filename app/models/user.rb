class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :documents
  has_many :personal_documents
  has_many :academic_activity_documents

  has_many :titles
  has_many :universities, through: :titles

  User.eager_load(:titles)

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates_uniqueness_of :email
  #validates_presence_of :role
  validates_presence_of :name
  validates_presence_of :last_name


  #accepts_nested_attributes_for :universities

  has_attached_file :avatar, :styles => {:medium => '300x300>', :thumb => '100x100>'}, :default_url => '/images/avatar_default.png'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def compound_name
    name+' '+last_name
  end

  def role_to_s
    role.humanize
  end

  def degree
    titles.where(level: '0')
  end

  def specialty
    titles.where(level: '1')
  end

  def sub_specialty
    titles.where(level: '2')
  end

  def master
    titles.where(level: '3')
  end

  def doctor
    titles.where(level: '4')
  end

  def pos_doctor
    titles.where(level: '5')
  end

  def continous
    titles.where(level: '6')
  end

  enum role: [ :administrador, :moderador, :aspirante, :especialista, :invitado]

end
