import axios, {
  InternalAxiosRequestConfig,
  AxiosResponse,
  AxiosError,
  AxiosRequestConfig,
  AxiosInstance
} from '@ohos/axios';
import CommConfig from "../config/CommConfig"

/**
 * 请求枚举
 */
export enum RequestMethod {
  GET = "GET",
  POST = "POST",
  PUT = "PUT",
  DELETE = "DELETE",
  OPTIONS = "OPTIONS"
}

/**
 * 返回体
 */
interface ApiResponse<T> {
  data: T,
  errorCode?: number,
  errorMsg?: string,
}

/**
 * 请求实例
 */
const instance: AxiosInstance = axios.create({
  baseURL: CommConfig.BASE_URL,
  timeout: CommConfig.TIME_OUT,
  headers: {
    'Content-Type': 'application/json'
  },
})

export default <T>(config: AxiosRequestConfig): Promise<ApiResponse<T>> => {

  /**
   * 请求发起前添加拦截器
   */
  instance.interceptors.request.use((config: InternalAxiosRequestConfig) => {
    config.headers["name"] = "ly"
    return config;
  })

  /**
   * 拿到结果后进行拦截
   */
  instance.interceptors.response.use((response: AxiosResponse) => {
    return response.data;
  }, (error: AxiosError) => {


    return Promise.reject(error)
  })
  return instance(config)
}