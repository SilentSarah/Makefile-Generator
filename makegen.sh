#!/bin/bash

##########################################
#			Author: SSarah				 #
#			Start Date: 2023-09-22		 #
##########################################

<< EOF cat
USER GUIDE: run this command inside project folder!
EOF

curr_dir=$(find . -not -path './.*' -type f -name "*.cpp" | cut -b 3- | tr '\n' ' ')

gen_makefile() {
	name=$1
	compiler=$2
	file_ext="c"
	if [ "$compiler" = "c++" ]
	then
		std="-std=c++98"
		file_ext="cpp"
	else
		curr_dir=$(find . -not -path './.*' -type f -name "*.c" | cut -b 3- | tr '\n' ' ')
	fi
	cat << EOF > Makefile
NAME = $name
CC = $compiler
FLAGS = -Wall -Werror -Wextra $std
SRC = \$(addprefix ./, $d)
OBJ = \$(SRC:.$file_ext=.o)

.PHONY: all clean fclean re

all: \$(NAME)

\$(NAME): \$(SRC) \$(OBJ)
	\$(CC) \$(FLAGS) \$(OBJ) -o \$@

%.o: %.$file_ext
	\$(CC) \$(FLAGS) -c \$< -o \$@

clean:
	rm -rf \$(OBJ)

fclean: clean
	rm -rf \$(NAME)

re: fclean all
EOF
echo "Makefile has been generated successfully!"
}

take_input() {
	echo "Write program name:"
	read user_input
	echo "Which language will this projet be written on? C or C++:"
	read lang
	if [ "$user_input" = "" ]
	then
		echo "Invalid Input, try again."
		take_input
	else 
		if [ "$lang" = "C" ]
		then
			compiler="cc"
		elif [ "$lang" = "C++" ]
		then
			compiler="c++"
		else
			echo "Invalid Input, try again."
			take_input
		fi
		gen_makefile $user_input $compiler
	fi
}

take_input