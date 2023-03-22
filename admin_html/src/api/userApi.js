import axios from '@/utils/request';

export function getUserListApi(data) {
  return axios.post({
    url: '/user/list',
    data: data,
  }).then((res) => {
    return res
  })
}

export function getUserStatusApi(data) {
  return axios.post({
    url: '/user/status',
    data: data
  }).then((res) => {
    return res
  })
}

export function getUserDelApi(params) {
  return axios.post({
    url: '/user/del',
    data: params,
  }).then((res) => {
    return res
  })
}

export function getUserDetailApi(data) {
  return axios.post({
    url: '/user/detail',
    data: data,
  }).then((res) => {
    return res
  })
}

export function getUserAddApi(data) {
  return axios.post({
    url: '/user/add',
    data: data,
  }).then((res) => {
    return res
  })
}

export function getUserEditApi(data) {
  return axios.post({
    url: '/user/edit',
    data: data,
  }).then((res) => {
    return res
  })
}
export function getUserRealListApi(data) {
  return axios.post({
    url: '/userreal/list',
    data: data,
  }).then((res) => {
    return res
  })
}

export function getMoneyEditApi(data) {
  return axios.post({
    url: '/money/edit',
    data: data,
  }).then((res) => {
    return res
  })
}

export function getIsStatusApi(data) {
  return axios.post({
    url: '/user/is_status',
    data: data,
  }).then((res) => {
    return res
  })
}
export function getIsAgentApi(data) {
  return axios.post({
    url: '/user/agent',
    data: data,
  }).then((res) => {
    return res
  })
}
