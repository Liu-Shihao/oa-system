import request from '@/utils/request'


export function listProcesses(query) {
  return request({
    url: '/system/processes/list',
    method: 'get',
    params: query
  })
}

export function addProcesses(data) {
  return request({
    url: '/system/processes',
    method: 'post',
    data: data
  })
}

export function addProcessesSteps(data) {
  return request({
    url: '/system/processes/steps',
    method: 'post',
    data: data
  })
}

export function editProcessesSteps(data) {
  return request({
    url: '/system/processes/steps',
    method: 'put',
    data: data
  })
}

export function editProcesses(data) {
  return request({
    url: '/system/processes',
    method: 'put',
    data: data
  })
}

export function deleteProcesses(processesId) {
  return request({
    url: '/system/processes/'+ processesId,
    method: 'delete'
  })
}


