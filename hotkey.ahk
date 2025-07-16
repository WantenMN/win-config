#SingleInstance Force

; Volume control
^#=:: ; Ctrl + Win + =
{
  AdjustSoundSetVolume("+2")
  return
}

^#-:: ; Ctrl + Win + -
{
  AdjustSoundSetVolume("-2")
  return
}

; Screen brightness control
^+!+:: ; Ctrl + Shift + Alt + +
{
  AdjustScreenBrightness(+2)
  return
}

^+!-:: ; Ctrl + Shift + Alt + -
{
  AdjustScreenBrightness(-2)
  return
}

AdjustSoundSetVolume(step) {
  SoundSetVolume step
  volume := Floor(SoundGetVolume())
  ToolTip "Volume: " volume "%"
  SetTimer RemoveToolTip, -1000
}

AdjustScreenBrightness(step) {
  service := "winmgmts:{impersonationLevel=impersonate}!\\.\root\WMI"
  monitors := ComObjGet(service).ExecQuery("SELECT * FROM WmiMonitorBrightness WHERE Active=TRUE")
  monMethods := ComObjGet(service).ExecQuery("SELECT * FROM wmiMonitorBrightNessMethods WHERE Active=TRUE")
  minBrightness := 0

  curt := 0
  for monitor in monitors {
    curt := monitor.CurrentBrightness
    break
  }
  if (curt < minBrightness) {
    curt := minBrightness
  }
  toSet := curt + step
  if (toSet > 100) {
    ToolTip "Brightness: 100%"
    return
  }
  if (toSet < minBrightness) {
    toSet := minBrightness
  }

  for method in monMethods {
    method.WmiSetBrightness(1, toSet)
    break
  }
  ToolTip "Brightness: " toSet "%"
  SetTimer RemoveToolTip, -1000
}

RemoveToolTip() {
  ToolTip  ; Clears the tooltip
  return
}