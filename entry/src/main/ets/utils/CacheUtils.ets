import { preferences } from '@kit.ArkData'
import { Context } from '@kit.AbilityKit'
/**
 * 缓存工具类
 */
class CacheUtils {
  private preFMap: Map<string, preferences.Preferences> = new Map()

  /**
   * 读取
   * @param context
   * @param name
   */
  async loadPreference(context: Context, name: string) {
    try {
      const pref = await preferences.getPreferences(context, name)
      this.preFMap.set(name, pref)
    } catch (e) {
      console.log("缓存失败")
    }
  }

  /**
   * 设置
   * @param name
   * @param key
   * @param val
   */
  async setValue(name: string, key: string, val: preferences.ValueType) {
    if (!this.preFMap.has(name)) {
      return
    }
    try {
      const pref = this.preFMap.get(name)
      await pref?.put(key, val)
      await pref?.flush()
    } catch (e) {
      console.log("put error", name, key, val)
    }
  }

  /**
   * 获取
   * @param name
   * @param key
   * @param val
   * @returns
   */
  async getValue(name: string, key: string, val: preferences.ValueType) {
    if (!this.preFMap.has(name)) {
      return
    }
    try {
      const pref = this.preFMap.get(name)
      return await pref?.get(key, val)
    } catch (e) {
      console.log("get error", name)
      return
    }
  }

  /**
   * 删除
   * @param name
   * @param key
   */
  async deleteValue(name: string, key: string) {
    if (!this.preFMap.has(name)) {
      return
    }
    try {
      const pref = this.preFMap.get(name)
      await pref?.delete(key)
    } catch (e) {
      console.log("get error", name)
    }
  }


}

export default new CacheUtils()