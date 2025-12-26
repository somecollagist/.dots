import { monitorFile } from "ags/file"
import { Process } from "ags/process"
import { Accessor, createState } from "gnim"

const get_brightness_percent = () => {
  const now_brightness = parseInt(Process.exec("brightnessctl g"))
  const max_brightness = parseInt(Process.exec("brightnessctl m"))

  return now_brightness * 100 / max_brightness
}

const get_brightness_icon = (brightness: Number) => {
  return "󰃠"
}

export default() => {
  let brightness_percent  = createState(get_brightness_percent())
  let brightness_icon     = createState(get_brightness_icon(brightness_percent[0].get()))

  monitorFile("/sys/class/backlight/intel_backlight/brightness", async(_) => {
    brightness_percent[1](get_brightness_percent())
    brightness_icon[1](get_brightness_icon(brightness_percent[0].get()))
  })

  return (
    <box class="brightness node">
      <label label={brightness_icon[0]((i) => i)}></label>
      <label label={brightness_percent[0]((p) => `${p}`)}></label>
    </box>
  )
}