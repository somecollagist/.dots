import { Process } from "ags/process";
import { createPoll } from "ags/time";

const get_disk_usage = () => {
  let disk_stats = Process.exec("df -h --output=used,size,pcent /")
    .split(" ")
    .filter((t) => t.length != 0)
  return ` ${disk_stats[3]}/${disk_stats[4]} (${disk_stats[5]})`
}

export default() => {
  const disk_usage = createPoll(get_disk_usage(), 5000, get_disk_usage)

  return (
    <box class="disk node">
      <label label={disk_usage}></label>
    </box>
  )
}