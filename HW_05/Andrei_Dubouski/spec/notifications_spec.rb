# rubocop:disable all

require 'rspec'
require_relative '../notification.rb'

# Tests for all methods from the class Notifications
RSpec.describe Notifications do
  subject(:notifications) { Notifications.new }
  let(:name) { 'Alice' }
  let(:first_hw_name) { 'HW01' }
  let(:result_to_s) { ['Student Alice has sent HW01'] }

  describe '#initialize' do
    it 'return zero length array' do
      expect(notifications.all_notif.size).to eq 0
    end
  end

  describe '#add_new' do
    it 'add new notification' do
      size = notifications.all_notif.size
      notifications.add_new(first_hw_name, name)
      expect(notifications.all_notif.size - size).to eq 1
    end
  end

  describe '#to_s' do
    it 'convert all notifications to string' do
      notifications.add_new(first_hw_name, name)
      expect(notifications.to_s).to eq(result_to_s)
    end
  end

  describe '#read' do
    it 'set all notifications to "read" status"' do
      notifications.add_new(first_hw_name, name)
      notifications.read
      res_unread = 0
      res_read = 0
      notifications.all_notif.each do |note|
        res_unread += 1 if note[:status].eql?('unread')
        res_read += 1 if note[:status].eql?('read')
      end
      expect(res_unread).to eq(0)
      expect(res_read).to eq(1)
    end
  end
end
