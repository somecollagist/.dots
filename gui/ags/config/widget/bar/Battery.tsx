import { Accessor, createBinding, createState } from "gnim";
import Battery from "gi://AstalBattery?version=0.1";

const battery = Battery.get_default()

const CHARGING_ICON = ""
const DISCHARGING_ICONS = new Map();
DISCHARGING_ICONS.set("battery-level-0-symbolic",   "")
DISCHARGING_ICONS.set("battery-level-10-symbolic",  "")
DISCHARGING_ICONS.set("battery-level-20-symbolic",  "")
DISCHARGING_ICONS.set("battery-level-30-symbolic",  "")
DISCHARGING_ICONS.set("battery-level-40-symbolic",  "")
DISCHARGING_ICONS.set("battery-level-50-symbolic",  "")
DISCHARGING_ICONS.set("battery-level-60-symbolic",  "")
DISCHARGING_ICONS.set("battery-level-70-symbolic",  "")
DISCHARGING_ICONS.set("battery-level-80-symbolic",  "")
DISCHARGING_ICONS.set("battery-level-90-symbolic",  "")
DISCHARGING_ICONS.set("battery-level-100-symbolic", "")
const LOW_THRESHOLD = 20
const CRITICAL_THRESHOLD = 10

const get_icon = (s: string) => {
  const state = battery.get_state()

  switch(state) {
    case 1: // charging
      return CHARGING_ICON
    case 2: // discharging
    case 3: // empty
    case 4: // fully charged
    case 5: // pending charge
    case 6: // pending discharge
      return DISCHARGING_ICONS.get(s)
    default:
      return "?"
  }
}

const get_style: (() => string) = () => {
  const state = battery.get_state()
  const percentage = battery.get_percentage()*100
  let ret = "battery node "

  switch(state) {
    case 1: // charging
      ret += "charging "
      break
    case 2: // discharging
      ret += "discharging "
      break
    case 3: // empty
      ret += "empty "
      break
    case 4: // fully charged
      ret += "full "
      break
    case 5: // pending charge
      ret += "pending-charge "
      break
    case 6: // pending discharge
      ret += "pending-discharge "
      break
    default:
      ret += "unknown "
      break
  }
  
  if (percentage <= CRITICAL_THRESHOLD) {
    ret += "critical"
  }
  else if (percentage <= LOW_THRESHOLD) {
    ret += "low"
  }
  else {
    ret += "stable"
  }

  return ret
}

export default () => {
  const percentage  = createBinding(battery, "percentage")
  const icon = createBinding(battery, "battery_icon_name")

  return (
    <box class={icon((_) => get_style())||percentage((_) => get_style())}>
      <label label={icon((i) => get_icon(i))}/>
      <label label={percentage((p) => `${Math.round(p*100)}%`)}/>
    </box>
  )
}