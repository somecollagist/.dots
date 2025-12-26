import Hyprland from "gi://AstalHyprland?version=0.1";

const hyprland = Hyprland.get_default()

const WORKSPACE_NUMBERS = [
  "一",
  "二",
  "三",
  "四",
  "五",
  "六",
  "七",
  "八",
  "九",
  "十"
]

const get_workspace_indicators = (workspaces) => {
  let ret = []
  for (let x = 1; x <= 10; x++) {
    let element = <label/>
    element.label=`${WORKSPACE_NUMBERS[x-1]}`
    let workspace = workspaces.find((t) => t.get_name() == x)
    if (workspace !== undefined) {
      element.add_css_class(
        (x == hyprland.get_focused_workspace().get_name()) ?
        "active" : "open"
      )
    }
    else {
      element.add_css_class("closed")
    }
    ret.push(element)
  }
  return ret
}

export default() => {
  let workspaces = <box><box/></box>

  hyprland.connect("event", (_, _event) => {
    workspaces.remove(workspaces.get_first_child())
    let insert = <box class="node"/>
    get_workspace_indicators(hyprland.get_workspaces()).forEach((element) => {
      insert.append(element)
    })
    workspaces.append(insert)
  })

  return (
    <box class="workspaces">
      {workspaces}
    </box>
  )
}