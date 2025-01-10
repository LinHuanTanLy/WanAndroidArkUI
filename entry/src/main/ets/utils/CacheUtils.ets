import { preferences } from '@kit.ArkData'
import { Context } from '@kit.AbilityKit'
import { BusinessError } from '@kit.BasicServicesKit'

/**
 * 缓存工具类
 */


const CACHE_FILE_NAME = "ly_ARKUI_CACHE_FILE"


const USER_LOGIN_STATUS="ly_ARKUI_LOGIN_STATUS";

class CacheUtils {
  private _preference?: preferences.Preferences | undefined

  initPreference(context: Context, name: string) {
    this._preference = preferences.getPreferencesSync(context, { name: name })
    return this
  }

  getSinglePreference(context: Context): CacheUtils {
    return this.initPreference(context, CACHE_FILE_NAME)
  }


  saveVal(key:string,value:preferences.ValueType){
    this._preference?.putSync(key,value)
    this._preference?.flush((err:BusinessError)=>{
      if(err){
        console.log("lht----saveVal error",err)
      }
    })
  }
  getVal<T>(key:string,defaultVal:preferences.ValueType):T{
    return this._preference?.getSync(key,defaultVal)as T
  }



  updateUserLoginStatus(isLogin:boolean){
    this.saveVal(USER_LOGIN_STATUS,isLogin)
  }

  getUserLoginStatus(){
    return this.getVal<Boolean>(USER_LOGIN_STATUS,false)
  }
}



export default new CacheUtils()
