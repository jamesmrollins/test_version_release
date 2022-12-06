#"release_4.0"
INPUT_Model_Directory_Previous=$1 
#"mtl3.0_models"
INPUT_Model_Directory_Next=$2 
#"mtl4.0_models"
INPUT_Release_Directory=$3 

if [ -z "$INPUT_Release_Directory" ] || [ -z "$INPUT_Model_Directory_Previous" ] || [ -z "$INPUT_Model_Directory_Next" ]
then
	echo "Release directory name must be defined"
	echo "Model directory previous and next version name must be defined"
	exit 1
fi


if [ -n "$INPUT_Release_Directory" ]
then
	
	if [ ! -d "$INPUT_Release_Directory" ]; then
		mkdir "$INPUT_Release_Directory"
    fi
	cp blue/**/**/*_see.md $INPUT_Release_Directory/
	cp blue/readme.md $INPUT_Release_Directory/
fi


if [ -n "$INPUT_Model_Directory_Previous" ] && [ -n "$INPUT_Model_Directory_Next" ]
then
	
	if [ ! -d "blue/$INPUT_Model_Directory_Next" ]; then
		mkdir "blue/$INPUT_Model_Directory_Next"
    fi
	cp blue/$INPUT_Model_Directory_Previous/** blue/$INPUT_Model_Directory_Next/
fi

echo $?
