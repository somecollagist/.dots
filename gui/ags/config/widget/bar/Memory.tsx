import { Process } from "ags/process";
import { createPoll } from "ags/time";

const get_mem_usage = () => {
  let mem_stats = Process.exec("free -h --si")
    .split("\n")
    .map(t => t.split(" ").filter(s => s.length != 0));
  return ` ${mem_stats[1][2]}/${mem_stats[1][1]}`
}

export default() => {
  const mem_usage = createPoll(get_mem_usage(), 5000, get_mem_usage)

  return (
    <box class="memory node">
      <label label={mem_usage}></label>
    </box>
  )
}