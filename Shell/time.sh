# Australian Eastern Standard Time
function mytime {
  TZ="Australia/Brisbane" date +"%r %A, %d %B %Y"
}

alias AEST=mytime

# Eastern Standard Time (EST)
function EST {
  TZ="America/New_York" date +"%r %A, %d %B %Y"
}

# Pacific Standard Time (PST)
function PST {
  TZ="America/Los_Angeles" date +"%r %A, %d %B %Y"
}

# Universal Time Coordinated (UTC) or Grenwich-Meridian Time (GMT)
function GMT {
  TZ="Europe/London" date +"%r %A, %d %B %Y"
}

alias UTC=GMT

# Central European Time (CET)
function CET {
  TZ="Europe/Rome" date +"%r %A, %d %B %Y"
}

# Venezuelan Time
function VT {
  TZ="America/Caracas" date +"%r %A, %d %B %Y"
}
