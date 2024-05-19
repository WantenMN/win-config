#SingleInstance Force

Run("glazewm --config=`"config.yaml`"", , "Hide")

;Start
!^+Enter:: Run("glazewm --config=`"config.yaml`"", , "Hide")

;Stop
!+E:: Run("glazewm exit wm", , "Hide")