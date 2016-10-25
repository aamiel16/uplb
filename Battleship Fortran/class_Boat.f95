module class_Boat
	IMPLICIT NONE
	
	type Boat
    	character (LEN = 20) :: name
    	character (LEN = 5) :: tag
        integer :: size
        integer, allocatable :: coorRow(:), coorCol(:)
  	end type Boat

    contains
    
	subroutine initBoat(boatArr)
		IMPLICIT NONE
		!VARIABLES
        type(Boat) :: boatArr(7)

        !PROCESS
        call setVar(boatArr(1), "Aircraft Carrier", "AC", 5)
        call setVar(boatArr(2), "Battle Ship", "BS", 4)
        call setVar(boatArr(3), "Cruiser", "CR", 3)
        call setVar(boatArr(4), "Destroyer 1", "D1", 2)
        call setVar(boatArr(5), "Destroyer 2", "D2", 2)
        call setVar(boatArr(6), "Submarine 1", "S1", 1)
        call setVar(boatArr(7), "Submarine 2", "S2", 1)
        
    end subroutine initBoat

    subroutine setVar(this, thisName, thisTag, thisSize)
    	IMPLICIT NONE
        !VARIABLES
        type(Boat) :: this
        character (LEN = 2) :: thisTag
        character (LEN = *) :: thisName
        integer :: thisSize

        !PROCESS
        this%name = thisName
        this%tag = thisTag
        this%size = thisSize
        allocate (this%coorRow(thisSize), this%coorCol(thisSize))
    end subroutine setVar
end module class_Boat