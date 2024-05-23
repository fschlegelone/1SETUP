#!/bin/bash

# DOCUMENTATION: https://gist.github.com/bennlee/0f5bc8dc15a53b2cc1c81cd92363bf18

# -- KEY CODES -- #
left_control="0x7000000E0"
left_shift="0x7000000E1"
left_alt="0x7000000E2"
left_command="0x7000000E3"
right_control="0x7000000E4"
right_shift="0x7000000E5"
right_alt="0x7000000E6"
right_command="0x7000000E7" # not sure if that key exists

# -- REMAPPING FUNCTIONS -- # 
# left option(alt) to left command
# left command to left option(alt)

hidutil property --set '{"UserKeyMapping":[
  {
    "HIDKeyboardModifierMappingSrc": 0x7000000E3, 
    "HIDKeyboardModifierMappingDst": 0x7000000E2  
  },
  {
    "HIDKeyboardModifierMappingSrc": 0x7000000E2, 
    "HIDKeyboardModifierMappingDst": 0x7000000E3  
  }
]}'

# -- GET KEYMAPS -- #
hidutil property --get "UserKeyMapping"
