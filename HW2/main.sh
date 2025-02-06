#Test Input
string="1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet"

#Variables
IFS=$'\n' read -d '' -r -a my_array <<< "$string"
sum=0
sum3=0
count=0

#Main Loop
for element in "${my_array[@]}"; do
  ((count++))
  # echo "Processing: $element"

  # Use grep to extract numbers from the string
  numbers=$(echo "$element" | grep -o '[0-9]')

  # Check if numbers were found
  if [[ -n "$numbers" ]]; then
    # Get the first and last numbers using head and tail
    first=$(echo "$numbers" | head -n 1)
    last=$(echo "$numbers" | tail -n 1)

    # echo "Numbers found: $numbers"
    echo "$element: $first$last"
    sum=$(($sum + "$first$last"))
    if ((count % 3 == 0)); then
      sum3=$(($sum3 + "$first$last"))
    fi
  else
    echo "$element: No numbers found."
  fi

done

echo "The final sum is: $sum"
echo "The accurate sum is: $sum3"

#Playing around to get used to bash
if (("${sum: -2}" == '42')); then
  echo "Sum contains the ultimate answer."
fi