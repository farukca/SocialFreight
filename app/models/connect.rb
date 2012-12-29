class Connect
  include ActiveModel::Validations
  extend ActiveModel::Callbacks

  attr_accessor :position_id, :loading_id, :user_id
  define_model_callbacks :create


  validates_presence_of :position_id, presence: true
  validates_presence_of :loading_id, presence: true
  validates_presence_of :user_id

  validate  :operation_and_direction_must_be_same

  after_create :comment_connection

  def initialize(attributes = {})
    attributes.each do |name, value|
    	send("#{name}=", value)
    end
  end

  def persisted?
  	false
  end

  def create
    if self.valid?
    	_run_create_callbacks do
    	  @loading  = Loading.find(loading_id)
    	  @loading.position_id=position_id
        @loading.update_attribute(:position => @position)
        @loading.save!
    	end
    end
  end

private
  def operation_and_direction_must_be_same
  	@position = Position.find(position_id)
  	@loading  = Loading.find(loading_id)

  	if @position.operation != @loading.operation
  		errors[:base] << I18n.t("positions.message.operations_must_be_same")
  	end

  	if @position.direction != @loading.direction
  		errors[:base] << I18n.t("positions.message.directions_must_be_same")
  	end

    #TODO position and loading must be active

  end

  def comment_connection
  	@position = Position.find(position_id)
  	@loading  = Loading.find(loading_id)

  	Comment.log(user_id, @position, @position.reference, 'S', "added the booking reservation #{@loading.reference}")
  	Comment.log(user_id, @loading, @loading.reference, 'S', "connected this loading to project #{@position.reference}")

  end

end