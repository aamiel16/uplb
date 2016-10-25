#include <stdio.h>
#include "ProjectLib.h"

main(){
	int choice;
	int musicCount = 0, statusShuffle = 0;
	Node *head, *tail;
	
	/**INITIALIZE DUMMY NODES**/
	head = initNode(&head);
	tail = initNode(&tail);
	head->prev = tail->next = NULL;
	head->next = tail;
	tail->prev = head; 
	
	head = loadLibrary(&head, &tail, &musicCount);
		
	do{
		choice = printMenu(statusShuffle);
		switch(choice){
			case 1: //Add Music
				musicCount = addMusic(&head,&tail, musicCount);
			break;
			
			case 2: //Delete Music
				musicCount = deleteMusic(&head, &tail, musicCount);
			break;
			
			case 3: //View
				viewMusic(&head, &tail, musicCount);
			break;
			
			case 4: //Go to Now Playing
				nowPlaying(&head, &tail, musicCount, statusShuffle);
			break;
			
			case 5: //Turn ON Shuffle
				switchShuffle(&statusShuffle);
			break;
			
			case 0: //Exit
				saveLibrary(&head, &tail, musicCount);
				deAlloc(&head, &tail);
			break;
			
			default:
				printf("\n\t\t[ERROR]\n\t\t\tINVALID CHOICE..\n");
			break;
		}
	}while(choice!=0);
	
	
	
}