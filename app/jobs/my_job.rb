class MyJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
    Task.new.exec(message)
  end
end
