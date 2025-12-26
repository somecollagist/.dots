import app from "ags/gtk4/app"
import { Astal, Gdk } from "ags/gtk4"

import Battery from "./Battery"
import Brightness from "./Brightness"
import Clock from "./Clock"
import CPU from "./CPU"
import Disk from "./Disk"
import Memory from "./Memory"
import Network from "./Network"
import Volume from "./Volume"
import Workspaces from "./Workspaces"

export default function Bar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

  return (
    <window
      visible
      name="bar"
      class="Bar"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={app}>
      <centerbox cssName="centerbox">
        <box $type="start">
          <Workspaces/>
        </box>
        <box $type="center">
          <Clock/>
        </box>
        <box $type="end">
          <Volume/>
          <Brightness/>
          <Network/>
          <Disk/>
          <Memory/>
          <CPU/>
          <Battery/>
        </box>
      </centerbox>
    </window>
  )
}
