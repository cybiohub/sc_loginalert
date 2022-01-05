#! /bin/bash
#set -x
# * **************************************************************************
# * Creation:           (c) 2004-2021  Cybionet - Ugly Codes Division
# *
# * File:               encodepic.sh
# * Version:            0.1.0
# *
# * Comment:            Tool to encode picture for loginalert script.
# *
# * Date: December 20, 2021
# * Modification: December 20, 2021
# *
# * **************************************************************************
# * PICTURE
# *  Max Size: 312 x 56
# *
# *  cat picture.jpg | base64
# *  src=\"data:image/jpeg;base64,
# *  src=\"data:image/png;base64,
# *  src=\"data:image/svg+xml;base64,
# *
# * **************************************************************************

if [ -z "${1}" ]; then
   echo -e "\n\e[33mUsage: ./encodepic.sh <file>\e[0m\n\tThis script support jpg, png and svg file format.\n"
  exit
fi


# ## Application to encode picture.
appsEncoder=$(which base64)

# ##
dpkg-query -s "exiv2" > /dev/null 2>&1
dependencyExiv2=$(echo ${?})

# ## Check if Exiv2 package is installed.
# ## Result: 0=Installed, 1=Missing
if [ "${dependencyExiv2}" = 1 ]; then
  echo -e "\e[34;1;208mINFORMATION:\e[0m Installing the required dependencies Exiv2)."
  apt-get install -y exiv2
else
 appSize=$(which exiv2)
fi

# ##
if [[ "${1}" =~ ^(.*\.jpg|.*\.png|.*\.svg)$ ]]; then

  # ## Check the size of the picture
  imageSize=$("${appSize}" "${1}" dev/null 2>&1 | grep -i "Image size" | awk -F ": " '{print $2}')

  # ## Width (Max 312)
  Width=$(echo "${imageSize}" | awk -F " x " '{print $1}')
  if [ ${Width} -gt 312 ]; then
   echo -e "\n\e[33mWARNING: The width value is too high. Max size is 312 x 56 (yours ${imageSize}).\e[0m\n"
   exit 0
  fi

  # ## Height (Max 56)
  Height=$(echo "${imageSize}" | awk -F " x " '{print $2}')
  if [ ${Height} -gt 56 ]; then
   echo -e "\n\e[33mWARNING: The height value is too high. Max size is 312 x 56 (yours ${imageSize}).\e[0m\n"
   exit 0
  fi

  # ## Encode the picture in base64.
  cat "${1}" | "${appsEncoder}"
fi

# ## Exit.
echo 0

# ## END
