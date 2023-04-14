import request from '@/utils/request'

// 查询资产列表
export function listAsset(query) {
  return request({
    url: '/system/asset/list',
    method: 'get',
    params: query
  })
}


// 新增资产
export function addAsset(data) {
  return request({
    url: '/system/asset',
    method: 'post',
    data: data
  })
}

// 修改资产
export function updateAsset(data) {
  return request({
    url: '/system/asset',
    method: 'put',
    data: data
  })
}

// 删除资产
export function delAsset(assetId) {
  return request({
    url: '/system/asset/' + assetId,
    method: 'delete'
  })
}
