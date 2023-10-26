{ pkgs, config, ... }:

{

home.file = {
  ".config/waybar/style.css".text = ''
* {
    border-radius: 0;
    font-family: 'UbuntuMono Nerd Font';
    font-size: 10pt;
    min-height: 0;
}

window#waybar {
    background: rgba(00, 00, 00, 0.4);
    color: #DADAE8;
}

tooltip {
	background: #1E1E28;
	border-radius: 15px;
	border-width: 2px;
	border-style: solid;
	border-color: #a4b9ef;
	}

#workspaces {
    background: #332E41;
    margin-left: 5px;
    margin-top: 0px;
    margin-bottom: 0px;
    border-radius: 15px;
}

#workspaces button {
    padding-left: 10px;
    padding-right: 10px;
    min-width: 0;
    color: #DADAE8;
}

#workspaces button.active {
    color: #A4B9EF;
}

#workspaces button.urgent {
    color: #F9C096;
}

#workspaces button:hover {
    background: #332e41;
    border-color: #332e41;
	  color: #A4B9EF;
}

#memory, #temperature, #network, #clock, #battery, #pulseaudio, #workspaces, #mpd  {
	  padding: 2px 10px;
    background: #332E41;
    margin-top: 0px;
    margin-bottom: 0px;
}

#cpu {
    padding-left: 15px;
    padding-right: 2px;
    background: #332E41;
    border-radius: 15px 0px 0px 15px;
    margin-top: 0px;
    margin-bottom: 0px;
}

#disk {
    padding-left: 15px;
    padding-right: 2px;
    background: #332E41;
    border-radius: 15px 0px 0px 15px;
    margin-top: 0px;
    margin-bottom: 0px;
}

#custom-vpn {
    background: #332E41;
    padding-right: 10px;
    margin-top: 0px;
    margin-bottom: 0px;
}

#clock {
    padding-right: 15px;
    margin-right: 5px;
    border-radius: 0px 15px 15px 0px;
}
  '';
};

home.file = {
  ".config/waybar/config.jsonc".text = ''
{
    "position": "top",
    "height": 10,
    "modules-left": ["hyprland/window"],
    "modules-center": ["hyprland/workspaces"],
    "modules-right": ["disk", "memory", "temperature", "network", "custom/vpn", "pulseaudio", "battery", "clock"],
    // Modules configuration
	"hyprland/workspaces": {
		"disable-scroll": true,
    "active-only": false,
		"all-outputs": true,
		"format": "{icon}",
     "persistent_workspaces": {
       "1": [],
       "2": [],
       "3": [],
       "4": [],
       "5": [],
       "6": [],
       "7": [],
       "8": [],
       "9": [],
       "10": []
	},
        "format-icons": {
            "1": "",
            "2": "",
            "3": "",
            "4": "",
            "5": "",
            "6": "",
            "default": "",
            "urgent": "",
            "focused": "",
         }
     },
	"clock": {
		"format": "<span foreground='#C6AAE8'>  </span>{:%a %d %H:%M}",
        "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>",
	},
	"battery": {
        "states": {
            "warning": 30,
            "critical": 15,
        	},
		    "format": "<span size='13000' foreground='#B1E3AD'>{icon}</span> {capacity}%",
		    "format-warning": "<span size='13000' foreground='#B1E3AD'>{icon}</span> {capacity}%",
		    "format-critical": "<span size='13000' foreground='#E38C8F'>{icon}</span> {capacity}%",
		    "format-charging": "<span size='13000' foreground='#B1E3AD'>  </span>{capacity}%",
		    "format-plugged": "<span size='13000' foreground='#B1E3AD'>  </span>{capacity}%",
		    "format-alt": "<span size='13000' foreground='#B1E3AD'>{icon} </span> {time}",
		    "format-full": "<span size='13000' foreground='#B1E3AD'>  </span>{capacity}%",
        	"format-icons": ["  ", "  ", "  ", "  ", "  "],
            "tooltip-format": "{time}"
	},
	"network": {
        "format-wifi": "<span size='13000' foreground='#F2CECF'>  </span>{essid}",
        "format-ethernet": "<span size='13000' foreground='#F2CECF'>󰤭</span> Disconnected",
        "format-linked": "{ifname} (No IP) ",
        "format-disconnected": "<span size='13000' foreground='#F2CECF'> </span>Disconnected",
		"tooltip-format-wifi": "Signal Strenght: {signalStrength}%",
	},
    "cpu": {
        "interval": 5,
        "format": "︁ {}%",
        "max-length": 10
    },
    "memory": {
        "interval": 15,
        "format": "<span font='Font Awesome 5 Free 9'>︁</span> {used:0.1f}G/{total:0.1f}G",
        "tooltip": false
    },
    "disk": {
        "interval": 60,
        "format": "︁ {}%",
        "max-length": 10
    },
    "temperature": {
        "hwmon-path": "/sys/class/hwmon/hwmon2/temp1_input",
        "critical-threshold": 75,
        "interval": 5,
        "format": "{icon} {temperatureC}°",
        "tooltip": false,
        "format-icons": [
            "", // Icon: temperature-empty
            "", // Icon: temperature-quarter
            "", // Icon: temperature-half
            "", // Icon: temperature-three-quarters
            ""  // Icon: temperature-full
        ]
    },
	"pulseaudio": {
		"on-click": "pactl set-sink-mute @DEFAULT_SINK@ toggle",
		"format": "<span size='13000' foreground='#EBDDAA'>{icon}</span> {volume}%",
        "format-muted": "<span size='14000' foreground='#EBDDAA'></span> Muted",
        "format-icons": {
            "headphone": " ",
            "hands-free": " ",
            "headset": " ",
            "phone": " ",
            "portable": " ",
            "car": " ",
            "default": [" ", " "]
        },
    },
}
'';
};


}
