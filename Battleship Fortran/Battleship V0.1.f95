program battleShip
	use class_Boat
    use ModuleBattleship
	IMPLICIT NONE
    
	!VARIABLES
	character (LEN = 5), allocatable :: shipBoard1(:,:), shipBoard2(:,:) !Ship Board
    character (LEN = 5), allocatable :: moveBoard1(:,:), moveBoard2(:,:) !Move Board
    integer :: winval1, winval2 !Change here
    integer :: choice
	integer :: n = 10 !n is the size of the board
    logical :: loop = .true.

    !FOR BOATS
    type(Boat) :: boatArr1(7) !Player 1 Boats
    type(Boat) :: boatArr2(7) !Player 2 Boats
	
	!INITIALIZE BOARDS and SHIPS
    call system("mode 75")

	!PRINT MENU
    call printMenu(choice)

    !DO CHOICE
    while (loop) do
    	!INITIALIZE BOARDS and SHIPS and Winning Values
    	call initBoard(shipBoard1, n)
    	call initBoard(moveBoard1, n)
    	call initBoard(shipBoard2, n)
    	call initBoard(moveBoard2, n)
    	call initBoatArr(boatArr1)
    	call initBoatArr(boatArr2)
        winval1 = 18 
        winval2 = 18
        
		!Case Selections
    	select case (choice)
    		case (1) !New Game
        	!PLACE SHIPS
    		call putShip(shipBoard1, boatArr1, n, 1) !Player 1
    		call putShip(shipBoard2, boatArr2, n, 2) !Player 2
       	 	!START GAME
        	call takeTurn(moveBoard1, shipBoard1, moveBoard2, shipBoard2, winval1, winval2, n, loop, choice, boatArr1, boatArr2)
            !DEALLOCATE ARRAYS AFTER GAME
        	deallocate(moveBoard1, shipBoard1, moveBoard2, shipBoard2)
            
        	case (2) !Continue Last Game
			!GET DATA
            call takeTurn(moveBoard1, shipBoard1, moveBoard2, shipBoard2, winval1, winval2, n, loop, choice, boatArr1, boatArr2)
			
            
        	case (3) !Display Instructions
        	case (4) !Exit Game
           		loop = .false.
                print *, "GAME STOPED"
        	case default
    	end select
	end do
    
     
end program battleShip


    


