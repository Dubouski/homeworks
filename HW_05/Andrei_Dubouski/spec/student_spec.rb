# frozen_string_literal: true

require 'spec_helper'
require_relative '../student.rb'

# Tests for all methods from the class Student
RSpec.describe Student do
  subject { Student.new(name: 'Alice', sex: 'female', birthday: '12.12.1999') }
  let(:name) { 'Alice' }
  let(:sex) { 'female' }
  let(:birthday) { '12.12.1999' }
  let(:hw_name) { 'HW01' }
  let(:hw_source_code) { 'puts "Hello world!"' }
  let(:hw_new_source_code) { 'puts "Hello Bob"' }

  describe '#initialize' do
    it 'return name' do
      expect(subject.name).to eq name
    end
    it 'return sex' do
      expect(subject.sex).to eq sex
    end
    it 'return birthday' do
      expect(subject.birthday).to eq birthday
    end
    it 'return zero length array' do
      expect(subject.homework_list.size).to eq 0
    end
  end

  describe '#write_homework' do
    it 'write new homework' do
      subject.write_homework(hw_name, hw_source_code)
      expect(subject.homework_list.size).to eql 1
      expect(subject.homework_list.first.instance_of?(Homework))
    end
  end

  describe '#rewrite homework' do
    it 'write new homework if did not find homework' do
      expect(subject.homework_list.size).to eql 0
      subject.rewrite_homework(hw_name, hw_new_source_code)
      expect(subject.homework_list.size).to eql 1
      expect(subject.homework_list.first.source_code).to eql hw_new_source_code
    end
    it 'rewrite existing homework' do
      expect(subject.homework_list.size).to eql 0
      subject.write_homework(hw_name, hw_source_code)
      subject.rewrite_homework(hw_name, hw_new_source_code)
      expect(subject.homework_list.size).to eql 1
      expect(subject.homework_list.first.source_code).to eql hw_new_source_code
    end
  end

  describe '#submit_homework' do
    before do
      subject.write_homework(hw_name, hw_source_code)
      header_param = { 'Content-Type' => 'application/json' }
      response = { status: 200, body: 'OK', headers: {} }
      uri = 'https://httpbin.org/post'
      stub_request(:post, uri).with(headers: header_param).to_return(response)
    end

    it 'send post request with homework' do
      res = receive(subject.submit_homework(hw_name))
      expect(res)
    end
  end
end
