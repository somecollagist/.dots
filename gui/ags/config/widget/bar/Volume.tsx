import { Accessor, createBinding } from "gnim"
import Wp from "gi://AstalWp"

const wp = Wp.get_default()
const device = wp.audio.default_speaker

const VOLUME_ICONS = new Map()
VOLUME_ICONS.set("audio-volume-low-symbolic", "")
VOLUME_ICONS.set("audio-volume-medium-symbolic", "")
VOLUME_ICONS.set("audio-volume-high-symbolic", "")

export default() => {
  let volume_percent = createBinding(device, "volume")
  let volume_icon: Accessor<string> = createBinding(device, "volume-icon")

  return (
    <box class="volume node">
      <label label={volume_icon((i) => {
        if (volume_percent.get() == 0) {
          return ""
        } else {
          return VOLUME_ICONS.get(i)
        }
      })}/>
      <label label={volume_percent((p) => `${Math.round(p*100)}`)}/>
    </box>
  )
}