require 'rspec'
require 'spec_helper'
require_relative '../mentor.rb'
require_relative '../homework.rb'
require_relative '../student.rb'

# Tests for all methods from the class Mentor
RSpec.describe Mentor do
  let(:name) { 'Bob' }
  let(:sex) { 'male' }
  let(:date) { '11.11.1999' }
  subject(:mentor) { Mentor.new(name: name, sex: sex, birthday: date) }
  subject(:hw) { Homework.new(homework_name: 'HW01', student_name: 'Alice') }
  subject(:student) { Student.new(name: 'Alice', sex: sex, birthday: date) }

  describe '#initialize' do
    it 'return name' do
      expect(mentor.name).to eq name
    end
    it 'return sex' do
      expect(mentor.sex).to eq sex
    end
    it 'return birthday' do
      expect(mentor.birthday).to eq date
    end
    it 'return zero length array' do
      expect(mentor.notifications.all_notif.size).to eq 0
      expect(mentor.student_list.size).to eq 0
    end
  end

  describe '#check_homework' do
    # check sets homework status
    it 'check homework status successfully' do
      mentor.check_homework(hw)
      expect(hw.assessment).to be < 5
    end
    it 'check homework status unsuccessfully' do
      hw.source_code = 'HW01.rb'
      mentor.check_homework(hw)
      expect(hw.assessment).to be > 8
    end
  end

  describe '#subscribe_to_student' do
    #   def
    # student_list << new_student unless student_list.each.include?(new_student)
    it 'add student to array' do
      mentor.subscribe_to_student(student)
      expect(mentor.student_list.size).to eq(1)
    end
  end

  describe '#unread_notifications?' do
    it 'is true' do
      mentor.notifications.add_new('HW01', 'Alice')
      expect(mentor.unread_notifications?).to eq true
    end
    it 'is false' do
      mentor.notifications.add_new('HW01', 'Alice')
      mentor.notifications.read
      expect(mentor.unread_notifications?).to eq false
    end
  end

  describe '#notification' do
    it 'get correct string' do
      mentor.notifications.add_new('HW01', 'Alice')
      expect(mentor.notification).to eq(['Student Alice has sent HW01'])
    end
  end

  describe '#read_notifications!' do
    it 'set status for all notifications as read' do
      mentor.notifications.add_new('HW01', 'Alice')
      mentor.read_notifications!
      expect(mentor.notifications.all_notif.first[:status]).to eq('read')
    end
  end
end
