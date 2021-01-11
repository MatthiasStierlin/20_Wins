#!/bin/bash
# Skript: 20_Gewinnt.sh
# Aufruf: 20_Gewinnt.sh
# Matthias Stierlin

#BASH Cases einbauen

score=0
round=1

#Introduction
echo "Welcome to 20 Gewinnt!"
echo "20 Gewinnt! is a short mathematical game."
echo
echo "Choose your game mode"
echo "1 = Player vs Player"
echo "2 = Player vs Computer"
echo "3 = Computer vs Computer (You are a spectator)"
read gamemode
echo

announce_round () {
        echo
        tput setaf 1
        echo Round nr. : $round
        round=$(($round+1))
        tput sgr0
}

# Game-mode 1, Player vs Player
if [ "$gamemode" -eq 1 ]; then
    while [ "$score" -le 20 ]; do
        
        #Announce round
        announce_round

        #Player 1 plays
        echo Player 1 enter a 1 or 2:
        read player1Input
        echo
        score=$(($score+$player1Input))
        echo The score is right now: $score .

        #Check if Player 1 won.
        if [ "$score" -eq 20  ] || [ "$score" -gt 20 ]; then
            tput setaf 2
            echo Player 1 won.
            break
        fi
        echo

        #Player 2 plays
        echo Player 2 enter a 1 or 2:
        read player2Input
        echo
        score=$(($score+$player2Input))
        echo The score is right now: $score .

        #Check if Player 2 won.
        if [ "$score" -eq 20 ] || [ "$score" -gt 20 ]; then
            tput setaf 2
            echo Player 2 won.
            break
        fi
        echo
    done

# Game-mode 2, Player vs Computer
elif [ "$gamemode" -eq 2 ]; then
    while [ "$score" -le 20 ]; do

        #Announce round
        announce_round

        #Player plays
        echo Player enter a 1 or 2:
        read player1Input
        echo
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
    done

# Game-mode 3, Computer vs Computer
else
    while [ "$score" -le 20 ]; do

        #Announce round
        announce_round

        #Alpha plays
        echo
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
            echo "The score is right now: ${score}."
        fi

        #Check if Alpha won.
        if [ "$score" -eq 20 ] || [ "$score" -gt 20 ]; then
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
            echo "The score is right now: ${score}."
        fi
        
        #Check if Beta won.
        if [ "$score" -eq 20 ] || [ "$score" -gt 20 ]; then
            tput setaf 2
            echo Beta - Computer won.
            break
        fi
        
    done
fi

echo
tput setaf 2
echo Auf Wiedersehen ☺!
