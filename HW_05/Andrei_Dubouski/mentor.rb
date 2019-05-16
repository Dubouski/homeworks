# frozen_string_literal: true

require_relative 'human'
require_relative 'homework'
require_relative 'notification'

# Some documentation about class Mentor.
class Mentor < Human
  attr_accessor :notifications, :student_list

  def initialize(name:, sex:, birthday:)
    super
    @notifications = Notifications.new
    @student_list = []
  end

  def check_homework(homework)
    # set status homework
    # update homework => make it passed and set assessment
    # or add remarks for the homework.
    if homework.source_code
      homework.remark = 'done'
      homework.assessment = 9
    else
      homework.remark = 'failed'
      homework.assessment = 0
    end
    homework
  end

  def subscribe_to_student(new_student)
    student_list << new_student unless student_list.each.include?(new_student)
    new_student.mentors << self
  end

  def unread_notifications?
    # check if exist unread notifications
    notifications.all_notif.each do |note|
      return true if note[:status].eql?('unread')
    end
    false
  end

  def notification
    # see a notification in the notifications list,
    # something like ["Student #student_name has sent #homework_name"]
    notifications.to_s
  end

  def read_notifications!
    notifications.read
  end
end
