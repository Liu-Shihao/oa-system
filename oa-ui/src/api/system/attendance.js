import request from '@/utils/request'

// 查询考勤列表
export function listAttendance(query) {
  return request({
    url: '/system/attendance/list',
    method: 'get',
    params: query
  })
}

export function leave(query) {
  return request({
    url: '/system/attendance/leave',
    method: 'get',
    params: query
  })
}

export function findUserCurrentMonthAttendanceStatus(query) {
  return request({
    url: '/system/attendance/findUserCurrentMonthAttendanceStatus',
    method: 'get',
    params: query
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


