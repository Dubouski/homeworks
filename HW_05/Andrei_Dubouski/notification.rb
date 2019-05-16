# frozen_string_literal: true

# This class stores all notifications
class Notifications
  attr_accessor :all_notif

  def initialize
    @all_notif = []
  end

  def add_new(hw_name, st_name)
    all_notif << { status: 'unread', student: st_name, hw_name: hw_name }
  end

  def to_s
    output = []
    all_notif.each do |n|
      if n[:status].eql?('unread')
        output << "Student #{n[:student]} has sent #{n[:hw_name]}"
      end
    end
    output
  end

  def read
    # set all notifications to "read" status"
    all_notif.each do |n|
      n[:status] = 'read' if n[:status].eql?('unread')
    end
  end
end
