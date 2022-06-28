aws_profile() {
  aws_profile=$(aws configure list | egrep profile | awk '{print "("$2")"}')
  if [[ "${aws_profile}" == "(<not)" ]]
  then
    echo "(none)"
  else
    echo "${aws_profile}"
  fi  
}

PROMPT='$(aws_profile) '$PROMPT
