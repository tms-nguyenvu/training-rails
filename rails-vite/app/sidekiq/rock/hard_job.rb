class Rock::HardJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
    puts "#{Post.find(args)}"
  end


end
