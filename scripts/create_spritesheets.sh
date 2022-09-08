#!/bin/bash

set -e

readonly spritesheets_dir="spritesheets"

pushd ../assets

if [ ! -d "${spritesheets_dir}" ] ; then
	mkdir "${spritesheets_dir}"
fi

if [ -z "$(which TexturePacker)" ] ; then
	echo "Could not find TexturePacker."
	exit 0
fi

readonly directories=$(ls -R1 | grep -v "${spritesheets_dir}" | grep : | tr -d ":")

for directory in ${directories} ; do
	spritesheet_filename="$(echo ${directory} | sed 's|./||' | sed 's|/|_|g').png"
	spritesheet_coordinates_filename="$(echo ${directory} | sed 's|./||' | sed 's|/|_|g').json"
	spritesheet_filename="${spritesheets_dir}/${spritesheet_filename}"
	spritesheet_coordinates_filename="${spritesheets_dir}/${spritesheet_coordinates_filename}"

	if [ "." == "${directory}" ] ; then
		continue
	fi

	if [ "" == "$(ls ${directory} | grep png)" ] ; then
		continue
	fi

	echo Creating spritesheet:
	echo -e "\tdirectory=${directory}"
	echo -e "\tspritesheet_filename=${spritesheet_filename}"
	echo -e "\tspritesheet_coordinates_filename=${spritesheet_coordinates_filename}"

	TexturePacker --sheet ${spritesheet_filename} --data ${spritesheet_coordinates_filename} ${directory}
done

popd