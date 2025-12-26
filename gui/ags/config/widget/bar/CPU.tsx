import { Process } from "ags/process";
import { createPoll } from "ags/time";

const get_cpu_usage = () => {
  let idle_time = Number.parseFloat(
    Process.exec("top -b -n 1")
      .split("\n")[2]
      .split(/:|,/)
      .filter(t => t.endsWith("id"))[0]
      .trim()
      .replace(" id", "")
  )
  return ` ${Math.round((100-idle_time)*10)/10}%`
}

export default() => {
  const cpu_usage = createPoll(get_cpu_usage(), 5000, get_cpu_usage)

  return (
    <box class="cpu node">
      <label label={cpu_usage}></label>
    </box>
  )
}