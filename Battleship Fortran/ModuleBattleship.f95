module ModuleBattleship
	use class_Boat
	IMPLICIT NONE

	contains

	!===================================================!
    !                     SUBROUTINES                   !
	!===================================================!

	!PRINT MENU
    subroutine printMenu(choice)
		IMPLICIT NONE
        !Variables
		integer choice

        !Output
        call system("cls")
		print*," ________   ________   _________  _________  __       ______     " 
		print*,"/_______/\ /_______/\ /________/\/________/\/_/\     /_____/\    "
		print*,"\::: _ \  \\::: _  \ \\__.::.__\/\__.::.__\/\:\ \    \::::_\/_   "
		print*," \::(_) \/_ \::(_)  \ \  \::\ \     \::\ \   \:\ \    \:\/___/\  "
		print*,"  \::  _  \ \\:: __  \ \  \::\ \     \::\ \   \:\ \____\::___\/_ "
		print*,"   \::(_)  \ \\:.\ \  \ \  \::\ \     \::\ \   \:\/____/\\:____/\"
		print*,"    \_______\/ \__\/\__\/   \__\/      \__\/    \______\/\_____\/"
        print*,"             ______   ___   ___    ________  ______              "
		print*,"            /_____/\ /___/\/__/\  /_______/\/_____/\             "
		print*,"            \::::_\/_\::\ \\  \ \ \__.::._\/\:::_ \ \            "
		print*,"             \:\/___/\\::\/_\ .\ \   \::\ \  \:(_) \ \           "
		print*,"              \_::._\:\\:: ___::\ \  _\::\ \__\: ___\/           "
		print*,"                /____\:\\: \ \\::\ \/__\::\__/\\ \ \             "
		print*,"                \_____\/ \__\/ \::\/\________\/ \_\/             "
		print*,"       ______________      ______________      ______________    "
		print*,"       ||   [1]    ||      ||    [2]   ||      ||    [3]   ||    "
		print*,"       ||----------||      ||----------||      ||----------||    "
		print*,"       || New Game ||      || Continue ||      ||   Help   ||    "
		print*,"       ||----------||      ||----------||      ||----------||    "
		print*,"                           ______________                        "
		print*,"                           ||    [4]   ||                        "
		print*,"                           ||----------||                        "
		print*,"                           ||   Exit   ||                        "
		print*,"                           ||----------||                        "
        print*,"    _________________________________________________________    "
        print *,"                                                                "
        print*,"    ENTER THE NUMBER OF YOUR CHOICE:                                "
        read*, choice
    end subroutine printMenu
    
	!PRINT PLAYER LABEL
    subroutine printLabel(player)
    	IMPLICIT NONE
        !Variable
        integer :: player
        !Output
        call system("cls")
        if(player == 1)then 
        	print *, "                     ____  _                         _	" 	 
        	print *, "                    |  _ \| | __ _ _   _  ___ _ __  / |	"
       		print *, "                    | |_) | |/ _` | | | |/ _ \ '__| | |	"
        	print *, "                    |  __/| | (_| | |_| |  __/ |    | |	"
        	print *, "                    |_|   |_|\__,_|\__, |\___|_|    |_|	"
        	print *, "                                   |___/				"
        else
        	print *, "                     ____  _                         ____		"  
        	print *, "                    |  _ \| | __ _ _   _  ___ _ __  |___ \	" 
        	print *, "                    | |_) | |/ _` | | | |/ _ \ '__|   __) |	"
        	print *, "                    |  __/| | (_| | |_| |  __/ |     / __/	" 
        	print *, "                    |_|   |_|\__,_|\__, |\___|_|    |_____|	"
        	print *, "                                   |___/    					"
        end if
    end subroutine printLabel     

	!PRINT TEXT
    subroutine printText(text)
    	IMPLICIT NONE
        !Variable
        character (LEN = *) :: text
        integer :: i

        !Process
		if (text == "input") then
        	print *, ""
			print *, ((char(223)), i = 1,72)
        	print *, "                               I N P U T                                 "
        	print *, ((char(223)), i = 1,72)
            print *, ""
        else if (text == "error") then
          	print *, ""
			print '(24X,24(A))', ((char(223)), i = 1,24)
        	print *, "                               E R R O R                                 "
        	print '(24X,24(A))', ((char(223)), i = 1,24)
            print *, ""
        else if (text == "hit") then
          	print '(1/)'
            print *, ((char(223)), i = 1,72)
			print *, "                        _   _   ___   _____   _ "
			print *, "                       | | | | |_ _| |_   _| | |"
			print *, "                       | |_| |  | |    | |   | |"
			print *, "                       |  _  |  | |    | |   |_|"
			print *, "                       |_| |_| |___|   |_|   (_)"
            print *, ""
            print *, ((char(223)), i = 1,72)

        else if (text == "miss") then
          	print '(1/)'
            print *, ((char(223)), i = 1,72)
			print *, "                     __  __   ___   ____    ____          "
			print *, "                    |  \/  | |_ _| / ___|  / ___|         "
			print *, "                    | |\/| |  | |  \___ \  \___ \         "
			print *, "                    | |  | |  | |   ___) |  ___) |  _   _ "
			print *, "                    |_|  |_| |___| |____/  |____/  (_) (_)"
            print *, ""
            print *, ((char(223)), i = 1,72)
        else if (text == "player1win") then
          	print '(7/)'
			print *, "  ########  ##          ###    ##    ## ######## ########        ##   "
			print *, "  ##     ## ##         ## ##    ##  ##  ##       ##     ##     ####   "
			print *, "  ##     ## ##        ##   ##    ####   ##       ##     ##       ##   "
			print *, "  ########  ##       ##     ##    ##    ######   ########        ##   "
			print *, "  ##        ##       #########    ##    ##       ##   ##         ##   "
			print *, "  ##        ##       ##     ##    ##    ##       ##    ##        ##   "
			print *, "  ##        ######## ##     ##    ##    ######## ##     ##     ###### "  
            print*,"" 
			print*,"         :::       :::  :::::::::::  ::::    :::   ::::::::   ::: "
			print*,"         :+:       :+:      :+:      :+:+:   :+:  :+:    :+:  :+: "
			print*,"         +:+       +:+      +:+      :+:+:+  +:+  +:+         +:+ "
			print*,"         +#+  +:+  +#+      +#+      +#+ +:+ +#+  +#++:++#++  +#+ "
			print*,"         +#+ +#+#+ +#+      +#+      +#+  +#+#+#         +#+  +#+ "
			print*,"          #+#+# #+#+#       #+#      #+#   #+#+#  #+#    #+#      "
			print*,"           ###   ###    ###########  ###    ####   ########   ### "
            print '(5/)'    
		else if (text == "player2win") then
        	call system("cls")
        	print '(7/)'
			print *, "  ########  ##          ###    ##    ## ######## ########      #######  "
			print *, "  ##     ## ##         ## ##    ##  ##  ##       ##     ##    ##     ## "
			print *, "  ##     ## ##        ##   ##    ####   ##       ##     ##           ## "
			print *, "  ########  ##       ##     ##    ##    ######   ########      #######  "
			print *, "  ##        ##       #########    ##    ##       ##   ##      ##        "
			print *, "  ##        ##       ##     ##    ##    ##       ##    ##     ##        "
			print *, "  ##        ######## ##     ##    ##    ######## ##     ##    ######### " 
            print*,"" 
			print*,"         :::       :::  :::::::::::  ::::    :::   ::::::::   ::: "
			print*,"         :+:       :+:      :+:      :+:+:   :+:  :+:    :+:  :+: "
			print*,"         +:+       +:+      +:+      :+:+:+  +:+  +:+         +:+ "
			print*,"         +#+  +:+  +#+      +#+      +#+ +:+ +#+  +#++:++#++  +#+ "
			print*,"         +#+ +#+#+ +#+      +#+      +#+  +#+#+#         +#+  +#+ "
			print*,"          #+#+# #+#+#       #+#      #+#   #+#+#  #+#    #+#      "
			print*,"           ###   ###    ###########  ###    ####   ########   ### "
            print '(5/)'    
        else if (text == "turn1") then
          	call system("cls")
        	print '(7/)'
			print *, "  ########  ##          ###    ##    ## ######## ########        ##   "
			print *, "  ##     ## ##         ## ##    ##  ##  ##       ##     ##     ####   "
			print *, "  ##     ## ##        ##   ##    ####   ##       ##     ##       ##   "
			print *, "  ########  ##       ##     ##    ##    ######   ########        ##   "
			print *, "  ##        ##       #########    ##    ##       ##   ##         ##   "
			print *, "  ##        ##       ##     ##    ##    ##       ##    ##        ##   "
			print *, "  ##        ######## ##     ##    ##    ######## ##     ##     ###### "   
            print *, ""
			print *, "   ooooooooooooo    ooooo     ooo    ooooooooo.      ooooo      ooo "
			print *, "   8'   888   `8    `888'     `8'    `888   `Y88.    `888b.     `8' "
			print *, "        888          888       8      888   .d88'     8 `88b.    8  "
			print *, "        888          888       8      888ooo88P'      8   `88b.  8  "
			print *, "        888          888       8      888`88b.        8     `88b.8  "
			print *, "        888          `88.    .8'      888  `88b.      8       `888  "
			print *, "       o888o           `YbodP'       o888o  o888o    o8o        `8  "
            print '(5/)'         	
		else if (text == "turn2") then
          	call system("cls")
        	print '(7/)'
          	print *, "  ########  ##          ###    ##    ## ######## ########      #######  "
			print *, "  ##     ## ##         ## ##    ##  ##  ##       ##     ##    ##     ## "
			print *, "  ##     ## ##        ##   ##    ####   ##       ##     ##           ## "
			print *, "  ########  ##       ##     ##    ##    ######   ########      #######  "
			print *, "  ##        ##       #########    ##    ##       ##   ##      ##        "
			print *, "  ##        ##       ##     ##    ##    ##       ##    ##     ##        "
			print *, "  ##        ######## ##     ##    ##    ######## ##     ##    ######### " 
            print *, ""
			print *, "   ooooooooooooo    ooooo     ooo    ooooooooo.      ooooo      ooo "
			print *, "   8'   888   `8    `888'     `8'    `888   `Y88.    `888b.     `8' "
			print *, "        888          888       8      888   .d88'     8 `88b.    8  "
			print *, "        888          888       8      888ooo88P'      8   `88b.  8  "
			print *, "        888          888       8      888`88b.        8     `88b.8  "
			print *, "        888          `88.    .8'      888  `88b.      8       `888  "
			print *, "       o888o           `YbodP'       o888o  o888o    o8o        `8  "
            print '(5/)'
        end if
    end subroutine printText

	!INITIALIZE BOARD
    subroutine initBoard(board, n)
		IMPLICIT NONE
        !Variables
        character (LEN = 5) :: temp!Column and Row Headers
		character (LEN = 5), pointer :: board(:,:)
        integer :: n, i, j
        
        !Allocate and Initialize Array
        allocate(board(0:n,0:n))
		board = "-"
    	
        !Initialize Board's Row and Column Headers
        do i = 0,n
    		do j = 0,n
        		if (i==0 .and. j==0) then
            		board(0,0) = ""
            	else if (i>0 .and. j==0) then
              		temp = char(64+i)
                	board(i,j) = temp
            	else if (i==0 .and. j>0) then
              		write(temp,'(I0)')j
                	board(i,j) = temp
            	endif
        	enddo
    	enddo
    end subroutine initBoard

!=========================================================!    

	!INITIALIZE BOAT ARRAY
    subroutine initBoatArr(boatArr)
    	IMPLICIT NONE
        !Variables
        type(Boat) :: boatArr(7)
        
        !Initialize Boat Array
		call initBoat(boatArr)
    end subroutine initBoatArr

!=========================================================!
        
	!PRINT BOARD
    subroutine printBoard(board, n, tag)
		IMPLICIT NONE
        !Variables
    	character (LEN = 5) :: board(0:n,0:n)
        character (LEN = *) :: tag
    	integer :: i, j, n

		!Print Board
        if (tag == "ship") then
          	print *, ""
		    print *, ((char(223)), i = 1,72)
        	print *, "                           S H I P    B O A R D                          "
        	print *, ((char(223)), i = 1,72)
            print *, ""
        else 
          	print *, ""
          	print *, ((char(223)), i = 1,72)
        	print *, "                           M O V E    B O A R D                          "
        	print *, ((char(223)), i = 1,72)
            print *, ""
        end if
        
    	do i = 0,n
      		print '(1X,(11(A,2X),1/))', ((board(i,j)),j = 0,n)
    	enddo
	end subroutine printBoard

!=========================================================!    

    !PUT SHIPS IN BOARD
    subroutine putShip(board, boatArr, n, player)
    	IMPLICIT NONE
        !Variables
        integer :: i,j,n !Counters
        character (LEN = 5) :: board(0:n,0:n)
        type(Boat) :: boatArr(7)
        logical :: cond, cond2, checkCoord
        !For Coordinates
    	character (LEN = 3) :: coord
    	integer :: coorCol, coorRow, getNum, player

        !PROCESS
   		do i = 1,7 !Change size here! 7 is all ship
        	call printLabel(player)
    		call printBoard(board, n, "ship")
        	call printText("input")
    		print '(2X,A,I0,1X,A,1X,A)', "Enter the ", boatArr(i)%size, "coordinate/s for your:", boatArr(i)%name
        	do j = 1,boatArr(i)%size
            	print '(2X,A,I0,A)', "ENTER COORDINATE: (", (boatArr(i)%size-j)+1, " left)"
            	cond = .true.
            	read *, coord
            	while (cond) do
            		!PROCESS
                	cond = checkCoord(coord, j, boatArr(i)%size, boatArr(i)%coorRow, boatArr(i)%coorCol, cond2)
                    if (cond2) then !UNDEFINED ERROR
                    	cond = cond
					else	
						coorRow = getNum(coord(1:1))
            			read(coord(2:), '(I2)') coorCol
                        cond = cond .OR. (board(coorRow,coorCol)/= "-")
                    endif
                    
                    if (cond) then
	                   	call printText("error")
                      	print '(2X,A,I0,A)', "ENTER VALID COORDINATE: (", (boatArr(i)%size-j)+1, " left)"
                      	read *, coord
                    end if
                end do
            	!Store Coordinates
            	coorRow = getNum(coord(1:1))
            	read(coord(2:), '(I2)') coorCol
            	boatArr(i)%coorRow(j) = coorRow
            	boatArr(i)%coorCol(j) = coorCol
            
            	!Update Board
            	board(coorRow, coorCol) = boatArr(i)%tag
       		 end do    
    	end do
        
		call printLabel(player)
    	call printBoard(board, n, "ship")
       	call system("pause")
        
     end subroutine putShip
    
	!START GAME
    subroutine takeTurn(moveBoard1, shipBoard1, moveBoard2, shipBoard2, winval1, winval2, n, loop, choice, boatArr1, boatArr2)
		IMPLICIT NONE
        !Variables
        character (LEN = 5) :: shipBoard1(0:n,0:n), shipBoard2(0:n,0:n) 
    	character (LEN = 5) :: moveBoard1(0:n,0:n), moveBoard2(0:n,0:n)
        character (LEN = 1) :: again = "A"
        type(Boat) :: boatArr1(7) !Player 1 Boats
    	type(Boat) :: boatArr2(7) !Player 2 Boats
        integer :: winval1, winval2, error = -1
        integer :: n, playerTurn, player, choice
        logical :: loop
        !Take Turns
        playerTurn = 0
        error = -1
		if (choice==2) then !LOAD GAME DATA FIRST
        	call loadFile(shipBoard1, moveBoard1, shipBoard2, moveBoard2, winval1, winval2, n, playerTurn, error)
            if (error == 1) then
                call system("pause")
    			call putShip(shipBoard1, boatArr1, n, 1) !Player 1
    			call putShip(shipBoard2, boatArr2, n, 2) !Player 2				
            end if	
        end if
        
        while (winval1 > 1 .AND. winval2 > 1) do
			player = (mod(playerTurn,2)) + 1
            if (player == 1) then !PLAYER1 TURN
              	call printText("turn1")
                call system("pause")
                call printLabel(player)
           		call printBoard(shipBoard1, n, "ship")
                call printBoard(moveBoard1, n, "move")
                call printText("input")
                call doTurn(shipBoard1, moveBoard1, shipBoard2, moveBoard2, winval1, winval2, n, player, playerTurn)
                call system("pause")
                call system("cls")
			else !PLAYER2 TURN
            	call printText("turn2")
                call system("pause")
                call printLabel(player)
            	call printBoard(shipBoard2, n, "ship")
                call printBoard(moveBoard2, n, "move")
                call printText("input")
                call doTurn(shipBoard1, moveBoard1, shipBoard2, moveBoard2, winval1, winval2, n, player, playerTurn)
                call system("pause")
                call system("cls")
            end if
            playerTurn = playerTurn + 1
        end do

		if(winval1 == 0) then !Player 2 Wins
        	call printText("player2win")
        else if(winval2 == 0) then
          	call printText("player1win")
        else
          	loop = .false.
            return
        end if

        call printText("input")

        !Play Again?
        while (again /= "Y" .AND. again /= "N" .AND. again /= "y" .AND. again /= "n") do
        	print '(2X,A)', "P L A Y   A G A I N? (Y/N) "
        	read *, again
        end do

        if (again == "Y" .OR. again == "y") then
        	loop = .true.
        else
          	loop = .false.
        end if
        
    end subroutine takeTurn

	!Do Turn of Player
    subroutine doTurn(shipBoard1, moveBoard1, shipBoard2, moveBoard2, winval1, winval2, n, player, playerTurn)
		IMPLICIT NONE
        !Variables
        character (LEN = 5), target :: shipBoard1(0:n,0:n), shipBoard2(0:n,0:n)
    	character (LEN = 5), target :: moveBoard1(0:n,0:n), moveBoard2(0:n,0:n)
        character (LEN = 5), pointer :: shipBoardEnemy(:,:),  moveBoardTurn(:,:)
        integer, pointer :: winval
        integer, target :: winval1, winval2
        character (LEN = 3) :: move
        integer :: coorRow, coorCol, getNum
        integer :: n, player, playerTurn
        logical :: cond, cond2, condStop, checkMove
        
		!Initialization
        if (player == 1) then
            moveBoardTurn => moveBoard1
            shipBoardEnemy => shipBoard2
            winval => winval2
        else
            moveBoardTurn => moveBoard2
            shipBoardEnemy => shipBoard1
            winval => winval1
        end if
        
        !Process
        print '(2X,A,1X)', "ENTER COORDINATE OF MOVE: (STP - STOP GAME)"
        read *, move
        cond = .true.
        while (cond) do
        	cond = checkMove(move, cond2, condStop)
            if (condStop) then
                call saveFile(shipBoard1, moveBoard1, shipBoard2, moveBoard2, winval1, winval2, n, playerTurn)
                print *, "winval1 = ", winval1
                return
            end if
            if(cond2) then
            	cond = cond
            else
              	coorRow = getNum(move(1:1))
            	read(move(2:), '(I2)') coorCol
              	cond = (cond .OR. (moveBoardTurn(coorRow, coorCol) /= "-"))
            end if

            if (cond) then
              	call printText("error")
                print '(2X,A)', "ENTER VALID COORDINATE: (STP - STOP GAME)"
                read *, move
            end if
      	end do
        
        !Valid Move, then do Turn
        coorRow = getNum(move(1:1))
       	read(move(2:), '(I2)') coorCol

        if (shipBoardEnemy(coorRow,coorCol) /= "-") then !Hit
        	shipBoardEnemy(coorRow,coorCol) = "X"
            moveBoardTurn(coorRow,coorCol) = "H"
            winval = winval - 1
            call printText("hit")
       	else
          	moveBoardTurn(coorRow,coorCol) = "M"
            call printText("miss")
        end if

        nullify(moveBoardTurn, shipBoardEnemy, winval)
        
    end subroutine doTurn

   	!SAVE FILE
    subroutine saveFile(shipBoard1, moveBoard1, shipBoard2, moveBoard2, winval1, winval2, n, playerTurn)
		IMPLICIT NONE
        character (LEN = 5), target :: shipBoard1(0:n,0:n), shipBoard2(0:n,0:n)
    	character (LEN = 5), target :: moveBoard1(0:n,0:n), moveBoard2(0:n,0:n)
        integer, target :: winval1, winval2
        integer :: n, playerTurn, i, j

        !PROCESS/OPEN
        OPEN(unit = 10, file = "battledata.txt", status = "old", err = 11)
21		write(10,*)playerTurn
        write(10,*)winval1
        write(10,*)winval2
		
		!WRITE SHIPBOARD
        do i = 0,n
        	write(10,'(1X,(11(A,2X),1/))')(shipBoard1(i,j),j = 0,n)
       	end do
        do i = 0,n
        	write(10,'(1X,(11(A,2X),1/))')(shipBoard2(i,j),j = 0,n)
       	end do

        !WRITE MOVE BOARD
        do i = 0,n
        	write(10,'(1X,(11(A,2X),1/))')(moveBoard1(i,j),j = 0,n)
       	end do
        do i = 0,n
        	write(10,'(1X,(11(A,2X),1/))')(moveBoard2(i,j),j = 0,n)
       	end do

        !RETURN
        winval1 = -1
        winval2 = -1
        close(unit = 12)
		return

11		OPEN(unit = 10, file = "battledata.txt", status = "new")
		go to 21
    end subroutine saveFile

    !LOAD FILE
    subroutine loadFile(shipBoard1, moveBoard1, shipBoard2, moveBoard2, winval1, winval2, n, playerTurn, error)
		IMPLICIT NONE
        character (LEN = 5), target :: shipBoard1(0:n,0:n), shipBoard2(0:n,0:n)
    	character (LEN = 5), target :: moveBoard1(0:n,0:n), moveBoard2(0:n,0:n)
        integer, target :: winval1, winval2
        integer :: n, playerTurn, i, j, error

        !PROCESS/OPEN
        OPEN(unit = 12, file = "battledata.txt", status = "old", err = 13)
		read(12,*)playerTurn
        read(12,*)winval1
        read(12,*)winval2
		
		!WRITE SHIPBOARD
        do i = 0,n
        	read(12,'(1X,(11(A,2X),1/))')(shipBoard1(i,j),j = 0,n)
       	end do
        do i = 0,n
        	read(12,'(1X,(11(A,2X),1/))')(shipBoard2(i,j),j = 0,n)
       	end do

        !WRITE MOVE BOARD
        do i = 0,n
        	read(12,'(1X,(11(A,2X),1/))')(moveBoard1(i,j),j = 0,n)
       	end do
        do i = 0,n
        	read(12,'(1X,(11(A,2X),1/))')(moveBoard2(i,j),j = 0,n)
       	end do
        close(unit=12)
        return

13		call printText("error")
		print *, "                        N O  D A T A  F O U N D                          "
        print *, ""
        print '(24X,24(A))', ((char(223)), i = 1,24)
        print *, ""
        error = 1
        return
    end subroutine loadFile

    !===================================================!
    !                END of SUBROUTINES                 !
	!===================================================!
   
    
end module ModuleBattleship

!===================================================!
!              FUNCTIONS for MODULE                 !
!===================================================!
!Convert Letter Coordinate to Number
integer function getNum(coorTemp)
	IMPLICIT NONE
    !Variables
   	character (LEN = 1) :: coorTemp
   	character (LEN = 5) :: alphabetSmall(10), alphabetBig(10)
   	integer :: i
    
    !Initialize Array of Characters: A-J 
    getNum = -1
   	do i = 1,10
  		alphabetBig(i) = char(64+i)
   		alphabetSmall(i) = char(96+i)
   	enddo

    !Check Letter Coordinates and Convert to Number
   	do i = 1,10
   		if (alphabetSmall(i) == coorTemp .OR. alphabetBig(i) == coorTemp) then
    	   	getNum = i
       		exit
	   	end if
	end do  
end function getNum

!Check Coordinate if Valid for Ship Placement
logical function checkCoord(coord, counter, boatSize, boatRow, boatCol, condition1)
	IMPLICIT NONE
    !Variable
    character (LEN = *) :: coord
    integer :: getNum, coorCol, coorRow, counter, boatSize, i
    integer :: boatRow(boatSize), boatCol(boatSize), consRow, consCol
    logical :: rowCond, colCond, condition1

    common consRow, consCol
    
    !Process
    condition1 = .false.
    read(coord(2:), '(I2)', err = 9) coorCol
    
    !1st Conditions (Format & Bounds Conditions)
	if (getNum(coord(1:1)) == -1) then
    	checkCoord = .true.
      	return
   	else if (coorCol > 10 .OR. coorCol <= 0) then
      	checkCoord = .true.
      	return
    end if

    !2nd Conditions (ADJACENT COORDINATES CONDITIONS)
    !If coordinates get to 2nd Condition, then it passed Format & Bounds Condtions
    
	if (counter == 1) then !First Coordinate, no need to check
      	checkCoord = .false.
		return
    end if

	if (counter == 2) then !Check if second coordinate is adjacent of first coordinate
		coorRow = getNum(coord(1:1))
        read(coord(2:), '(I2)') coorCol
        
       	!CHECK COORDINATES
       	!If true, then adjacent. If false, then its either equal or not adjacent.
       	rowCond = ((coorRow == boatRow(1)-1).OR.(coorRow == boatRow(1)+1))
       	colCond = ((coorCol == boatCol(1)-1).OR.(coorCol == boatCol(1)+1))
            
       	if (rowCond) then !Means that row is adjacent, and now column must be same as first column to be adjacent
       		colCond = coorCol == boatCol(1)
            if (colCond) then
            	checkCoord = .false.
                consCol = coorCol
                consRow = -1
                return
            end if
		else if(colCond) then !Means that column is adjacent, and now row must be same as first row to be adjacent
            rowCond = coorRow == boatRow(1)
            if (rowCond) then
            	checkCoord = .false.
                consRow = coorRow
                consCol = -1
                return
            end if
        endif
    end if
        
    if (counter > 2) then !All other coordinates
		coorRow = getNum(coord(1:1))
        read(coord(2:), '(I2)') coorCol
		
		!Check if new coordinate is equal to previous coordinates
        do i = 1, counter - 1
			if (boatRow(i) == coorRow .AND. boatCol(i) == coorCol) then
				checkCoord = .true.
                return
            end if
        end do

        if (consCol > 0) then !Constant Column
        	if(coorCol == consCol) then !Valid Column, check Row
				do i = 1, counter-1
                	if	(coorRow == boatRow(i)-1 .OR. coorRow == boatRow(i)+1) then
                    	checkCoord = .false.
                        return
                    end if
                end do	
			end if
        else !Constant Row
        	if(coorRow == consRow) then !Valid Row, check Column
            	do i = 1, counter-1
                	if	(coorCol == boatCol(i)-1 .OR. coorCol == boatCol(i)+1) then
                    	checkCoord = .false.
                        return
                    end if
                end do		
			end if
        end if
        
    end if
      
	!Not a valid integer
9   checkCoord = .true.
	condition1 = .true.
	return
    
end function checkCoord

!Check coordinate if valid for Player Move
logical function checkMove(coord, condition, condStop)
	IMPLICIT NONE
    !Variables
    character (LEN = *) :: coord
    integer :: coorCol, getNum
    logical :: condition, condStop

    !Process
    condition = .false.
    condStop = .false.
	
	!If User wants to stop
    if (coord == "STP") then
      	condStop = .true.
        return
    end if
  
    !1st Conditions (Format & Bounds Conditions)
    read(coord(2:), '(I2)', err = 8) coorCol
	if (getNum(coord(1:1)) == -1) then
    	checkMove = .true.
      	return
   	else if (coorCol > 10 .OR. coorCol <= 0) then
      	checkMove = .true.
      	return
    end if
    
    checkMove = .false.
    return


8  checkMove = .true.
	condition = .true.
	return
    
end function checkMove
    

!===================================================!
!                  END of FUNCTIONS                 !
!===================================================! 

