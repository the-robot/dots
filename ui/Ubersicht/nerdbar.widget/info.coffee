#
# ──────────────────────────────────────────────── II ──────
#   :::::: I N F O : :  :   :    :     :        :          :
# ──────────────────────────────────────────────────────────
#

  #
  # ─── ALL COMMANDS ───────────────────────────────────────────────────────────
  #

  commands =
    battery:  "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto " +
              "| cut -f1 -d';'"
    date:     "date +\"%d/%m/%Y\""
    time:     "date +\"%H:%M\""
    wifi:     "/System/Library/PrivateFrameworks/Apple80211.framework/" +
              "Versions/Current/Resources/airport -I | " +
              "sed -e \"s/^ *SSID: //p\" -e d"
    volume:   "osascript -e 'output volume of (get volume settings)'"
    charging: "pmset -g batt | grep -w 'charging'"
    ip: "ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\\.){3}[0-9]*).*/\\2/p'"

  #
  # ─── COLORS ─────────────────────────────────────────────────────────────────
  #

  colors =
    black:   "#1d2021"
    grey:    "#a89984"
    red:     "#fb4924"
    bright_green:   "#3ebb26"
    green:   "#b8bb26"
    yellow:  "#fabd2f"
    orange:  "#db6f11"
    blue:    "#5491f2"
    magenta: "#b16286"
    cyan:    "#689d6a"
    white:   "#ebdbb2"

  #
  # ─── COMMAND ────────────────────────────────────────────────────────────────
  #

  command: "echo " +
           "$(#{ commands.battery }):::" +
           "$(#{ commands.date }):::" +
           "$(#{ commands.time }):::" +
           "$(#{ commands.wifi }):::" +
           "$(#{ commands.volume }):::" +
           "$(#{ commands.charging }):::" +
           "$(#{ commands.ip }):::"

  #
  # ─── REFRESH ────────────────────────────────────────────────────────────────
  #

  refreshFrequency: 1000

  #
  # ─── RENDER ─────────────────────────────────────────────────────────────────
  #

  render: ( ) ->
    """
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <div class="info-item ip">
      <div class="icon"><i class="fas fa-map-marker"></i></div>
      <span class="ip-output"></span>
    </div>
    <div class="info-item wifi">
      <div class="icon"><i class="fas fa-wifi"></i></div>
      <span class="wifi-output"></span>
    </div>
    <div class="info-item volume">
      <div class="icon"><span class="fas volume-icon"></span></div>
      <span class="volume-output"></span>
    </div>
    <div class="info-item battery">
      <div class="icon"><span class="fas battery-icon"></span></div>
      <span class="battery-output"></span>
    </div>
    <div class="info-item time">
      <div class="icon"><i class="fas fa-clock"></i></div>
      <span class="time-output"></span>
    </div>
    """

  #
  # ─── RENDER ─────────────────────────────────────────────────────────────────
  #

  getDate: () ->


  update: ( output ) ->
    output = output.split( /:::/g )

    battery  = output[ 0 ]
    time     = output[ 1 ] + " " + output[ 2 ]
    wifi     = if output[ 3 ] then output[ 3 ] else "Wifi disconnected"
    volume   = output[ 4 ]
    charging = output[ 5 ]
    local_ip = if output[ 6 ] then output[ 6 ] else "No IP"

    # create string for display
    volume_str = if parseInt(output[ 4 ]) == NaN  then "Unavailable" else "#{ volume }%"

    $( ".battery-output" ) .text( "#{ battery }" )
    $( ".time-output" )    .text( "#{ time }" )
    $( ".wifi-output" )    .text( "#{ wifi }" )
    $( ".volume-output" )  .text( "#{ volume_str }" )
    $( ".ip-output" )      .text( "#{ local_ip }" )

    @handleBattery(
      Number( battery.replace( /%/g, "" ) ),
      charging != ""
    )
    @handleVolume( Number( volume ) )

  #
  # ─── HANDLE BATTERY ─────────────────────────────────────────────────────────
  #

  handleBattery: ( percentage, charging ) ->
    batteryIcon = switch
      when charging          then "fa-bolt"
      when percentage <=  12 then "fa-battery-empty"
      when percentage <=  25 then "fa-battery-quarter"
      when percentage <=  50 then "fa-battery-half"
      when percentage <=  75 then "fa-battery-three-quarters"
      when percentage <= 100 then "fa-battery-full"
    $( ".battery-icon" ).html( "<i class=\"fas #{ batteryIcon }\"></i>" )

    color = switch
      when charging          then colors.bright_green
      when percentage <=  12 then colors.red
      when percentage <=  25 then colors.orange 
      when percentage <=  50 then colors.yellow 
      when percentage <=  75 then colors.green 
      when percentage <= 100 then colors.bright_green
    $( ".battery .icon" ).css( "background-color", color )

  #
  # ─── HANDLE VOLUME ──────────────────────────────────────────────────────────
  #

  handleVolume: ( volume ) ->
    volumeIcon = switch
      when volume ==   0 then "fa-volume-off"
      when volume <=  50 then "fa-volume-down"
      when volume <= 100 then "fa-volume-up"
    $( ".volume-icon" ).html( "<i class=\"fa #{ volumeIcon }\"></i>" )

  #
  # ─── STYLE ──────────────────────────────────────────────────────────────────
  #

  style: """
    .battery .icon
      background-color: #{ colors.green }
    .time .icon
      background-color: #{ colors.blue }
    .wifi .icon
      background-color: #{ colors.yellow }
    .volume .icon
      background-color: #{ colors.cyan }
    .ip .icon
      background-color: #{ colors.grey }

    .info-item
      display: flex
      padding: 0 5px 0 0
      background-color: #{ colors.white }
      margin-right: 15px
      .icon
        padding: 1px 5px
        margin-right: 5px

    display: flex

    top: 3.5px
    right: 0px
    font-family: 'Fira Code'
    font-size: 13px
    font-smoothing: antialiasing
    z-index: 0
  """

# ──────────────────────────────────────────────────────────────────────────────
