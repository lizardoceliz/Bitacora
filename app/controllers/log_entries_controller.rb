class LogEntriesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @log_entry = current_user.log_entries.build(params[:log_entry])
    if @success = @log_entry.save
      @log_entries = current_user.log_entries.most_recent.pending
    end
  end

  def destroy
    @log_entry = current_user.log_entries.find(params[:id])
    @log_entry.destroy
  end

  def complete
    @log_entry = current_user.log_entries.find(params[:id])
    @log_entry.complete!
  end
  
  def starred
    @log_entry = current_user.log_entries.find(params[:id])
    @log_entry.starred!
    @log_entries = current_user.log_entries.most_recent.pending
  end
end

