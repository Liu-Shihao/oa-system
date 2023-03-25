import request from '@/utils/request'

// 查询考勤列表
export function listAttendance(query) {
  return request({
    url: '/system/attendance/list',
    method: 'get',
    params: query
  })
}

export function findUserCurrentMonthAttendanceStatus() {
  return request({
    url: '/system/attendance/findUserCurrentMonthAttendanceStatus',
    method: 'get'
  })
}

export function findUserCurrentDayAttendanceRecord() {
  return request({
    url: '/system/attendance/findUserCurrentDayAttendanceRecord',
    method: 'get'
  })
}

// 打卡 
export function attendance(data) {
  return request({
    url: '/system/attendance',
    method: 'post',
    data: data
  })
}


