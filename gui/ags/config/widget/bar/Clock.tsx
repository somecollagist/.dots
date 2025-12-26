import { createPoll } from "ags/time";

export default() => {
  const time = createPoll("", 1000, "date '+%Y-%m-%d %H:%M:%S'")
  return (
    <box class="clock node">
      <label label={time}></label>
    </box>
  )
}