#!/bin/bash

function test () {

    i=0

    echo -e "\n\e[1;33m-----[Algorithm app]-----\n\e[0m"; sleep 0.1

    echo -e "\e[1;37mTest n°1 :" ; sleep 0.05
    (./amazed < bash_test/file/test1.txt) > retur.txt
    sdiff retur.txt bash_test/resolve/r_test1.txt
    if [ $? -eq 0 ]; then
        echo -e "\n\e[1;32mSUCESS\n\e[0m"
        ((i++))
    else
        echo -e "\n\e[1;31mFAILURE\n\e[0m"
    fi
    rm retur.txt

    echo -e "\e[1;37mTest n°2 :" ; sleep 0.05
    (./amazed < bash_test/file/test2.txt) > retur.txt
    sdiff retur.txt bash_test/resolve/r_test2.txt
    if [ $? -eq 0 ]; then
        echo -e "\n\e[1;32mSUCESS\n\e[0m"
        ((i++))
    else
        echo -e "\n\e[1;31mFAILURE\n\e[0m"
    fi
    rm retur.txt

    echo -e "\n\e[1;33m-----[Parsing]-----\n\e[0m"; sleep 0.1

    echo -e "\e[1;37mTest n°1 (Room given before the start):" ; sleep 0.05
    (./amazed < bash_test/file/test2.txt) > retur.txt
    sdiff retur.txt bash_test/resolve/r_header2.txt
    if [ $? -eq 0 ]; then
        echo -e "\n\e[1;32mSUCESS\n\e[0m"
        ((i++))
    else
        echo -e "\n\e[1;31mFAILURE\n\e[0m"
    fi
    rm retur.txt

    echo -e "\e[1;37mTest n°2 (Comment at beginning of the file):" ; sleep 0.05
    (./amazed < bash_test/file/comment_begin.txt) > retur.txt
    sdiff retur.txt bash_test/resolve/begin_comment.txt
    if [ $? -eq 0 ]; then
        echo -e "\n\e[1;32mSUCESS\n\e[0m"
        ((i++))
    else
        echo -e "\n\e[1;31mFAILURE\n\e[0m"
    fi
    rm retur.txt

    echo -e "\e[1;37mTest n°3 (Comment after the number of robots):" ; sleep 0.05
    (./amazed < bash_test/file/comment_after_robot.txt) > retur.txt
    sdiff retur.txt bash_test/resolve/comment_after_r.txt
    if [ $? -eq 0 ]; then
        echo -e "\n\e[1;32mSUCESS\n\e[0m"
        ((i++))
    else
        echo -e "\n\e[1;31mFAILURE\n\e[0m"
    fi
    rm retur.txt

    echo -e "\e[1;37mTest n°4 (Comment in the middle of the rooms definitions):" ; sleep 0.05
    (./amazed < bash_test/file/comment_room.txt) > retur.txt
    sdiff retur.txt bash_test/resolve/comment_room_r.txt
    if [ $? -eq 0 ]; then
        echo -e "\n\e[1;32mSUCESS\n\e[0m"
        ((i++))
    else
        echo -e "\n\e[1;31mFAILURE\n\e[0m"
    fi
    rm retur.txt

    echo -e "\e[1;37mTest n°5 (Comment in the middle of the rooms definitions(again)):" ; sleep 0.05
    (./amazed < bash_test/file/test1.txt) > retur.txt
    sdiff retur.txt bash_test/resolve/r_header1.txt
    if [ $? -eq 0 ]; then
        echo -e "\n\e[1;32mSUCESS\n\e[0m"
        ((i++))
    else
        echo -e "\n\e[1;31mFAILURE\n\e[0m"
    fi
    rm retur.txt

    echo -e "\e[1;37mTest n°6 (Comment after the rooms definitions):" ; sleep 0.05
    (./amazed < bash_test/file/comment_after_room.txt) > retur.txt
    sdiff retur.txt bash_test/resolve/comment_after_room_r.txt
    if [ $? -eq 0 ]; then
        echo -e "\n\e[1;32mSUCESS\n\e[0m"
        ((i++))
    else
        echo -e "\n\e[1;31mFAILURE\n\e[0m"
    fi
    rm retur.txt

    echo -e "\e[1;37mTest n°7 (Comment in the middle of the pipes):" ; sleep 0.05
    (./amazed < bash_test/file/comment_middle_pipe.txt) > retur.txt
    sdiff retur.txt bash_test/resolve/comment_middle_pipe.txt
    if [ $? -eq 0 ]; then
        echo -e "\n\e[1;32mSUCESS\n\e[0m"
        ((i++))
    else
        echo -e "\n\e[1;31mFAILURE\n\e[0m"
    fi
    rm retur.txt

    echo -e "\e[1;37mTest n°8 (Comment at the end of the file):" ; sleep 0.05
    (./amazed < bash_test/file/comment_end_file.txt) > retur.txt
    sdiff retur.txt bash_test/resolve/comment_end_file_r.txt
    if [ $? -eq 0 ]; then
        echo -e "\n\e[1;32mSUCESS\n\e[0m"
        ((i++))
    else
        echo -e "\n\e[1;31mFAILURE\n\e[0m"
    fi
    rm retur.txt

    echo -e "\e[1;37mTest n°9 (Full map parsing):" ; sleep 0.05
    (./amazed < bash_test/file/test5.txt) > retur.txt
    sdiff retur.txt bash_test/resolve/r_header5.txt
    if [ $? -eq 0 ]; then
        echo -e "\n\e[1;32mSUCESS\n\e[0m"
        ((i++))
    else
        echo -e "\n\e[1;31mFAILURE\n\e[0m"
    fi
    rm retur.txt

    echo -e "\n\n\n\e[1;36m------------------------[ERROR HANDLER]------------------------\n\e[0m"; sleep 0.1

    echo -e "\n\e[1;33m-----[Robustness - Opening valid file]-----\n\e[0m"; sleep 0.05

    echo -e "\e[1;37mTest n°1 (Bad character) :" ; sleep 0.05
    ./amazed < bash_test/file/bad_character.txt
    retour=$?
    if [ $retour -eq  84 ]; then
        echo -e "\\ne[1;32mSUCESS\n\e[0m"
        ((i++))
    else
        echo -e "\n\e[1;31mFAILURE\n\e[0m"
    fi

    echo -e "\e[1;37mTest n°2 (Bad instruction start) :" ; sleep 0.05
    ./amazed < bash_test/file/bad_instruction_start.txt
    retour=$?
    if [ $retour -eq  84 ]; then
        echo -e "\n\e[1;32mSUCESS\n\e[0m"
        ((i++))
    else
        echo -e "\n\e[1;31mFAILURE\n\e[0m"
    fi

    echo -e "\e[1;37mTest n°3 (Bad instruction end) :" ; sleep 0.05
    ./amazed < bash_test/file/bad_instruction_end.txt
    retour=$?
    if [ $retour -eq  84 ]; then
        echo -e "\n\e[1;32mSUCESS\n\e[0m"
        ((i++))
    else
        echo -e "\n\e[1;31mFAILURE\n\e[0m"
    fi

    echo -e "\e[1;37mTest n°4 (same coordinates) :" ; sleep 0.05
    ./amazed < bash_test/file/same_coord.txt
    retour=$?
    if [ $retour -eq  84 ]; then
        echo -e "\n\e[1;32mSUCESS\n\e[0m"
        ((i++))
    else
        echo -e "\n\e[1;31mFAILURE\n\e[0m"
    fi

    echo -e "\e[1;37mTest n°5 (zero robot) :" ; sleep 0.05
    ./amazed < bash_test/resolve/bad_number_robot.txt
    retour=$?
    if [ $retour -eq  84 ]; then
        echo -e "\n\e[1;32mSUCESS\n\e[0m"
        ((i++))
    else
        echo -e "\n\e[1;31mFAILURE\n\e[0m"
    fi

    echo -e "\e[1;37mTest n°6 (negative robot) :" ; sleep 0.05
    ./amazed < bash_test/resolve/bad_number_robot2.txt
    retour=$?
    if [ $retour -eq  84 ]; then
        echo -e "\n\e[1;32mSUCESS\n\e[0m"
        ((i++))
    else
        echo -e "\n\e[1;31mFAILURE\n\e[0m"
    fi

    p=$((i * 100 / 17))
    echo -e "\n\n\e[1;23m----------------------------------------------------------------[$p%]----------------------------------------------------------------\n\n\n\e[0m"
}

make re
test
make fclean