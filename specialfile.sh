shell scripting 3:

while loop: use to loop over a process unless the conditions changes

syntax:
while command1 ; do 

   Statement(s) to be executed if command1 is true
done

example:
#!/bin/bash
a=0
while [ $a -lt 5 ]; do
        echo "etech"
done

#!/bin/bash
while true; do
  echo "ok"
done 

until loop: use to iterate over a set of processes until conditions changes

example

#!/bin/sh

a=10

until [ $a -lt 10 ]; do
   echo $a
   a=$(($a + 1))  
done

example1: some CICD application

#!/bin/bash
codeCoverage=85
until [ "$codeCoverage" -gt 90 ]; do
  echo " Build failure"
done

Break loop: use to stop a continues process 
example:
#!/bin/sh
a=0    

while [ $a -lt 10 ]
do
   echo $a
   if [ $a -eq 5 ]
   then
      break
   fi
   a=$(($a +1))
done

source: is a shell built-in command which is used to read and execute the content of a file(or script), passed as an argument in the current shell script

versions.env
versions=(
         tag1
         tag2
         tag3
         tag4
     )  

ARG versions
FROM ubuntu:$versions
RUN apt update -y && apt install nginx

#!/bin/bash
echo "this script will automate multiple docker image build from one dockerfile"

source versions.env 

for i in ${versions[@]}; do
   docker build -t etechapp:$i .
done



Creating Functions:
To declare a function, simply use the following syntax −

function_name () { 
   list of commands
}
example:
#!/bin/bash

# Define your function here
Hello() {
   echo "Hello World"
}

# Invoke your function
Hello

example: 
#!/bin/bash
echo " script to analyse other scripts "
./scriptname1.sh
status=$?
if [ "$status" -eq 0 ]; then
  echo "scriptname1.sh ran successfully"
else
  echo "scriptname1 failure"
fi 

scriptname1.sh
#!/bin/bash
etech_check() {
read -p "please enter a number: " num1
read -p "please enter second number: " num2

if [ $num1 -eq $num2 ]; then
  echo " numbers are equal"
  exit 0
else
  echo " numbers are not equal"
  exit 1 
fi
}
etech_check
==================================================================================================
Pass Parameters to a Function:
You can define a function that will accept parameters while calling the function.\ 
These parameters would be represented by $1, $2 and so on.
example: 
#!/bin/bash

# Define your function here
Hello () {
   echo "Hello World $1 $2"
}

# Invoke your function
Hello $1 $2

Returning Values from Functions:

notes:
If you execute an exit command from inside a function, its effect is not only to terminate execution of the function but also of the shell program that called the function.

If you instead want to just terminate execution of the function, then there is way to come out of a defined function.

Based on the situation you can return any value from your function using the return command whose syntax is as follows −

return code

example:
#!/bin/sh

# Define your function here
Hello () {
   echo "Hello World $1 $2"
   return 10
}

# Invoke your function
Hello Zara Ali

# Capture value returnd by last command
ret=$?

echo "Return value is $ret"

Nested Functions:
One of the more interesting features of functions is that they can call themselves and also other functions. A function that calls itself is known as a recursive function.

Following example demonstrates nesting of two functions −

example;

#!/bin/sh

# Calling one function from another
number_one () {
   echo "This is the first function speaking..."
   number_two
}

number_two () {
   echo "This is now the second function speaking..."
}

# Calling function one.
number_one


