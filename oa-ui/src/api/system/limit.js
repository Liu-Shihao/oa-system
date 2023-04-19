import request from '@/utils/request'


export function listLimit(query) {
  return request({
    url: '/system/limit/list',
    method: 'get',
    params: query
  })
}

export function holidayBalance() {
  return request({
    url: '/system/limit/holiday/balance',
    method: 'get'
  })
}


export function addLimit(data) {
  return request({
    url: '/system/limit',
    method: 'post',
    data: data
  })
}

export function updateLimit(data) {
  return request({
    url: '/system/limit',
    method: 'put',
    data: data
  })
}

export function delLimit(assetId) {
  return request({
    url: '/system/limit/' + assetId,
    method: 'delete'
  })
}
