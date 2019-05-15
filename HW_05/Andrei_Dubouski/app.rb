require_relative 'mentor'
require_relative 'student'

# create student and mentor
student = Student.new(name: 'Alice', sex: 'female', birthday: '12.12.1999')
mentor = Mentor.new(name: 'Charlie', sex: 'male', birthday: '11.11.1999')

# subscribe
mentor.subscribe_to_student(student)

homework = student.write_homework('HW01', 'puts "hi"')
student.submit_homework('HW01')

mentor.check_homework(homework)

mentor.read_notifications! if mentor.unread_notifications?
