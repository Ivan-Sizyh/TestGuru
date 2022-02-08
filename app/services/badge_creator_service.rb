class BadgeCreatorService
  def initialize(params)
    @title = params[:title]
    @description = params[:description]
    @image = params[:image]
    @event = params[:event]
    @criterion = params[:criterion]
  end

  def create_badge
    if @event == Badge::events['all_tests_category'].to_s
      @criterion = Category.find_by(title: @criterion)&.id
    end

    if @event == Badge::events['first_try'].to_s
      @criterion = Test.find_by(title: @criterion)&.id
    end

    Badge.create(
      title: @title,
      description: @description,
      image: @image,
      event: @event,
      criterion: @criterion
    )
  end
end