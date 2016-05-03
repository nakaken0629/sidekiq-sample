class StartController < ApplicationController
  protect_from_forgery :except => [:run]

  def run
    # 即時実行する場合
    MyJob.perform_later('Task exec.')
 
    # 時間を置いて実行する場合
    MyJob.set(wait: 10.second).perform_later('Task exec 1.')
    MyJob.set(wait: 10.second).perform_later('Task exec 2.')
 
    render :nothing => true
  end
end
