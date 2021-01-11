#!/bin/bash
# Script: 20_wins.sh
# Call up: 20_wins.sh
# Matthias Stierlin

declare score=0
declare round=1
declare gameversion=''
declare gamemode=1

#Introduction
echo "Welcome to 20 Wins!"
echo "20 Wins! is a short mathematical game."
echo

#
get_GameVersion() {
    tput setaf 7
    echo "Choose your game version:"
    echo "C = Classical"
    echo "D = Developer's way :)"
    echo "PC = Computer vs Computer (You are merely a spectator"
    read gameversion
    echo

    case $gameversion in
        # Classic
        "C") get_Gamemode
        classic
        ;;

        # The developer's version 
        "D") get_Gamemode 
        developer
        ;;

        # Computer vs Computer 
        "PC") compVScomp
        ;;

        # Start again
        *)
            echo "Please give in one of the following options:"
            get_GameVersion
        ;;
    esac
}

# Reads in the gamemode.
get_Gamemode() {
    echo "Choose your game mode:"
    echo "1 = Player vs Player"
    echo "2 = Player vs Computer"
    read gamemode
    echo 
}

# Prints out the round number.
announce_round () {
    echo
    tput setaf 1
    echo Round nr. : $round
    round=$(($round+1))
    tput sgr0
}

# In this version of the game you play by
# entering always the new score.
classic() {
      case $gamemode in
        # Game-mode 1, Player vs Player
        1) while true; do
            #Announce round
            announce_round

            while [ "$score" -le 20 ]; do
                #Player 1 plays
                echo Player 1:
                read player1Input
                echo

                # Validate input
                if [[ $player1Input -lt $(($score + 1)) ]] || [[ $player1Input -gt $(($score + 2)) ]]; then
                    echo "Wrong input!"
                    continue
                elif [[ $player1Input -gt 20 ]]; then
                    echo "Idiot, say 20!"
                    continue
                else
                    # Input is correct, carry on
                    break;
                fi
            done
            
            score=$player1Input
            echo The score is right now: $score .

            #Check if Player 1 won.
            if [ "$score" -eq 20  ]; then
                tput setaf 2
                echo Player 1 won.
                break
            fi
            echo

            while [ "$score" -le 20 ]; do
                #Player 2 plays
                echo Player 2:
                read player2Input
                echo
            
                # Validate input
                if [[ $player2Input -lt $(($score + 1)) ]] || [[ $player2Input -gt $(($score + 2)) ]]; then
                    echo "Wrong input!"
                    continue
                elif [[ $player2Input -gt 20 ]]; then
                    echo "Would you just say 20!"
                    continue
                else
                    # Input is correct, carry on
                    break;
                fi
            done

            score=$player2Input
            echo The score is right now: $score .

            #Check if Player 2 won.
            if [ "$score" -eq 20 ] || [ "$score" -gt 20 ]; then
                tput setaf 2
                echo Player 2 won.
                break
            fi
            echo
        done;;

        # Game-mode 2, Player vs Computer
        2) while [ "$score" -le 20 ]; do

            #Announce round
            announce_round

            while [ "$score" -le 20 ]; do
                #Player 1 plays
                echo Player 1:
                read player1Input
                echo

                # Validate input
                if [[ $player1Input -lt $(($score + 1)) ]] || [[ $player1Input -gt $(($score + 2)) ]]; then
                    echo "Wrong input!"
                    continue
                elif [[ $player1Input -gt 20 ]]; then
                    echo "Would you just say 20!"
                    continue
                else
                    # Input is correct, carry on
                    break;
                fi
            done
            
            score=$player1Input
            echo "The score is right now: $score."

            #Check if Player 1 won.
            if [ "$score" -eq 20  ] || [ "$score" -gt 20 ]; then
                tput setaf 2
                echo Player 1 won.
                break
            fi
            echo

            #Computer plays
            if [[ "$score" -eq "18" ]]; then
                score=$(( $score + 2))
                echo "2"
            elif [[ "$score" -eq "19" ]]; then
                score=$(( $score + 1))
                echo "1"
            else
                echo "Computer:"
                computerInput=$(($[RANDOM%2] + 1))
                echo "${computerInput}"
                score=$(( $score + $computerInput))
            fi
            echo "The score is right now: ${score}."
            
            #Check if Computer won.
            if [ "$score" -eq 20 ] || [ "$score" -gt 20 ]; then
                tput setaf 2
                echo Computer won.
                break
            fi
            echo
        done;;
    esac
}

# In this version of the game you play by
# either entering 1 or 2.
developer() {
    case $gamemode in
        # Game-mode 1, Player vs Player
        1) while [ "$score" -le 20 ]; do
            #Announce round
            announce_round

            while true; do
                #Player 1 plays
                echo Player 1 enter a 1 or 2:
                read player1Input
                echo

                if [ "$player1Input" -eq 1 ] || [ "$player1Input" -eq 2 ]; then
                    break
                else 
                    echo "Wrong input!"
                fi
            done

            score=$(($score+$player1Input))
            echo The score is right now: $score .

            #Check if Player 1 won.
            if [ "$score" -eq 20  ] || [ "$score" -gt 20 ]; then
                tput setaf 2
                echo Player 1 won.
                break
            fi
            echo

            while true; do
                #Player 2 plays
                echo Player 2 enter a 1 or 2:
                read player2Input
                echo

                if [ "$player2Input" -eq 1 ] || [ "$player2Input" -eq 2 ]; then
                    break
                else 
                    echo "Wrong input!"
                fi
            done

            score=$(($score+$player2Input))
            echo The score is right now: $score .

            #Check if Player 2 won.
            if [ "$score" -eq 20 ] || [ "$score" -gt 20 ]; then
                tput setaf 2
                echo Player 2 won.
                break
            fi
            echo
        done;;

        # Game-mode 2, Player vs Computer
        2) while [ "$score" -le 20 ]; do
            #Announce round
            announce_round

            while true; do
                #Player 1 plays
                echo Player 1 enter a 1 or 2:
                read player1Input
                echo

                if [ "$player1Input" -eq 1 ] || [ "$player1Input" -eq 2 ]; then
                    break
                else 
                    echo "Wrong input!"
                fi
            done
            
            score=$(($score+$player1Input))
            echo The score is right now: $score .

            #Check if Player won.
            if [ "$score" -eq 20  ] || [ "$score" -gt 20 ]; then
                tput setaf 2
                echo Player won.
                break
            fi
            echo

            #Computer plays
            if [[ "$score" -eq "18" ]]; then
                score=$(( $score + 2))
                echo "Alpha - Computer: 2"
            elif [[ "$score" -eq "19" ]]; then
                score=$(( $score + 1))
                echo "Alpha - Computer: 1"
            else
                echo "Computer:"
                computerInput=$(($[RANDOM%2] + 1))
                echo "Computer ${computerInput}"
                score=$(( $score + $computerInput))
                echo "The score is right now: ${score}."
            fi
            
            #Check if Computer won.
            if [ "$score" -eq 20 ] || [ "$score" -gt 20 ]; then
                tput setaf 2
                echo Computer won.
                break
            fi
            echo
        done;;
    esac
}

compVScomp() {
    # Computer vs Computer
    while [ "$score" -le 20 ]; do
        #Announce round
        announce_round

        #Alpha plays
        if [[ "$score" -eq "18" ]]; then
            score=$(( $score + 2))
            echo "Alpha - Computer: 2"
        elif [[ "$score" -eq "19" ]]; then
            score=$(( $score + 1))
            echo "Alpha - Computer: 1"
        else
            computerInput1=$(($[RANDOM%2] + 1))
            echo "Alpha - Computer: ${computerInput1}"
            score=$(( $score + $computerInput1))
        fi
        echo "The score is right now: ${score}."

        #Check if Alpha won.
        if [ "$score" -eq 20 ]; then
            tput setaf 2
            echo Alpha - Computer won.
            break
        fi

        # Beta plays
        echo
        if [[ "$score" -eq "18" ]]; then
            score=$(( $score + 2))
            echo "Beta - Computer: 2"
        elif [[ "$score" -eq "19" ]]; then
            score=$(( $score + 1))
            echo "Beta - Computer: 1"
        else
            computerInput2=$(($[RANDOM%2] + 1))
            echo "Beta - Computer: ${computerInput2}"
            score=$(( $score + $computerInput2))
        fi
        echo "The score is right now: ${score}."
        
        #Check if Beta won.
        if [ "$score" -eq 20 ]; then
            tput setaf 2
            echo Beta - Computer won.
            break
        fi
    done
}

while true; do
    get_GameVersion

    tput setaf 3
    echo
    echo "If you would like to play again press 'y'?"
    read playAgain
    if [[ "$playAgain" == "y" || "$playAgain" == "Y" ]]; then
        score=0
        round=1
        echo
        continue
    else
        break;
    fi
done

echo
tput setaf 2
echo "Bye bye ☺!"