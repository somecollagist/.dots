import { Process } from "ags/process";
import { createPoll } from "ags/time";

const NETWORK_ICONS = new Map()
NETWORK_ICONS.set("802-11-wireless", "")
NETWORK_ICONS.set("ethernet", "󰈀")

const get_net_usage = () => {
  let net_stats = Process.exec("nmcli -t -f TYPE,DEVICE,NAME c show --active")
    .split("\n")
    .map(t => t.split(":").filter(s => s != ""))
    .filter(t => !["loopback"].includes(t[0]))
  if (net_stats.length == 0) {
    return "󰌙  Not Connected"
  }
  return `${NETWORK_ICONS.get(net_stats[0][0])}  ${net_stats[0][2]}@${net_stats[0][1]}`
}

const get_style = () => {
  let ret = "network node "

  let connected = Process.exec("ip route")
  ret += connected.length == 0 ? "disconnected" : "connected"

  return ret
}

export default() => {
  const net_usage = createPoll(get_net_usage(), 5000, get_net_usage)

  return (
    <box class={net_usage((_) => get_style())}>
      <label label={net_usage}></label>
    </box>
  )
}