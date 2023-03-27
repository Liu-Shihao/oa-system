import request from '@/utils/request'

// 查询考勤列表
export function listTimeline(query) {
  return request({
    url: '/system/timeline/list',
    method: 'get',
    params: query
  })
}

export function addTimeline(data) {
  return request({
    url: '/system/timeline',
    method: 'post',
    data: data
  })
}
export function editTimeline(data) {
  return request({
    url: '/system/timeline',
    method: 'put',
    data: data
  })
}

export function deleteTimeline(data) {
  return request({
    url: '/system/timeline',
    method: 'put',
    data: data
  })
}


