/**
Authors: 
Sanchez, Adrian Amiel
Aquino, Areanne
	      

Section: CMSC21 U-2L
**/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include <time.h>

/**STRUCTURE DEFINITONS**/
typedef struct musictag{
	char title[50];
	char artist[50];
	char album[50];
	char genre[10];
	int length;
}Music;

typedef struct nodetag{
	Music music;
	struct nodetag *next;
	struct nodetag *prev;
}Node;

/**FUNCTION PROTOTYPES**/
Node* initNode();
void chop();
void switchShuffle();
void printDetail();
void printDetailStart();
int printMenu();
int addNode();
char* pickGenre();
void viewMusic();
int printView();
void viewByTitle();
void viewByArtist();
int deleteMusic();
void saveLibrary();
Node* loadLibrary();
void deAlloc();

/**FUNCTION DEFINITIONS**/
Node* initNode(Node **newNode){
	*newNode = (Node*)malloc(sizeof(Node));
	return (*newNode);
}

void chop(char *str){
    str[strcspn(str, "\n")] = '\0';
}

void switchShuffle(int *statusShuffle){
	if (*statusShuffle == 0){
		*statusShuffle = 1;
	}else if (*statusShuffle == 1){
		*statusShuffle = 0;
	}
}

void printDetail(Node *temp){
	printf("\n\n\n\t\t[NOW PLAYING]\n");
	printf("\n\t\t|Title: %s\n\t\t|Artist: %s\n\t\t|Album: %s\n\t\t|Genre: %s\n\t\t|Length: %d\n\n\t\t| << [1] Previous      [2] Next >> |\n\t\t|\t  [0] Back to MENU         |\n\n\t\t Choice: ",temp->music.title,temp->music.artist, temp->music.album, temp->music.genre, temp->music.length);
}

void printDetailStart(Node *temp){
	printf("\n\n\n\t\t[NOW PLAYING]\n");
	printf("\n\t\t|Title: %s\n\t\t|Artist: %s\n\t\t|Album: %s\n\t\t|Genre: %s\n\t\t|Length: %d\n\n\t\t|                      [2] Next >> |\n\t\t|\t  [0] Back to MENU         |\n\n\t\t Choice: ",temp->music.title,temp->music.artist, temp->music.album, temp->music.genre, temp->music.length);
}

void startTimer(int *elapse, Node *temp, int *choice){
	time_t start, end;
 
    time(&start); //Start timer
    do {
        time(&end);
        *elapse = end - start;
		scanf("%d",choice);
    } while(*elapse < temp->music.length);  
	
}

int printView(){
	int choice;
	printf("\n\n\t\t[VIEW]");
	printf("\n\t\t|Choose View: ");
	printf("\n\t\t    [1] View by Title");
	printf("\n\t\t    [2] View by Artist");
	printf("\n\t\t    [3] View by Album");
	printf("\n\n\t\t    [0] Back to Menu");
	printf("\n\t\t|Enter Choice: ");
	scanf("%d", &choice);
	return choice;
}

void viewByTitle(Music *arr, int count){
	int i, j, choice;
	Node *sortH, *sortT, *newNode, *ptr;
	Music temp;
	
	//Initialize Nodes
	sortH = initNode(&sortH);
	sortT = initNode(&sortT);
	
	sortH->prev = sortT->next = NULL;
	sortH->next = sortT;
	sortT->prev = sortH; 
	
	//Sort by Title
	for(i=0; i<count; i++){
		for(j=0; j<count-1; j++){
			if(strcmp(arr[j].title, arr[j+1].title) > 0){
				temp = arr[j];
				arr[j] = arr[j+1];
				arr[j+1] = temp;
			}
		}
	}
	
	//Copy array to list
	for(i=0; i<count; i++){
		newNode = initNode(&newNode);
		newNode->music = arr[i];
		//Node Placement
		newNode->next = sortT;
		newNode->prev = (sortT)->prev;
		(sortT)->prev->next = newNode;
		(sortT)->prev = newNode;
		newNode = NULL;
	}
	
	//View
	ptr = sortH->next;
	printf("\n\n\t\t[VIEW by TITLE]\n\n");
	printf("\n\t\tSONGS: \n");
	printf("\t\t------------------------------------\n");
	for(i=0; i<count; i++){
		printf("\t\t    %s\n", ptr->music.title);
		printf("\t\t------------------------------------\n");
		ptr = ptr->next;
	}
}

void viewByArtist(Music *arr, int count){
	int i, j, ctr = 0;
	Music temp;
	//Sort by Artist
	for(i=0; i<count; i++){
		for(j=0; j<count-1; j++){
			if(strcmp(arr[j].artist, arr[j+1].artist) > 0){
				temp = arr[j];
				arr[j] = arr[j+1];
				arr[j+1] = temp;
			}
		}
	}
	
	//Sort by Title
	for(i=0; i<count; i++){
		for(j=0; j<count-1; j++){
			if(strcmp(arr[j].artist, arr[j+1].artist) == 0 && strcmp(arr[j].title, arr[j+1].title) > 0){
				temp = arr[j];
				arr[j] = arr[j+1];
				arr[j+1] = temp;
			}
		}
	}
	
	printf("\n\n\t\t[VIEW by ARTIST]\n");
	for(i=0; i<count; i++){
		if(ctr==0){
			printf("\n\n\t\t|%s|\n", arr[i].artist);
		}
		if(strcmp(arr[i].artist, arr[i+1].artist) != 0){
			ctr=0;
		}else{
			ctr++;
		}	
		printf("\t\t------------------------------------\n");		
		printf("\t\t    %s\n", arr[i].title);
		printf("\t\t------------------------------------\n");	
	}
}

void viewByAlbum(Music *arr, int count){
	int i, j, ctr = 0;
	Music temp;
	//Sort by Album
	for(i=0; i<count; i++){
		for(j=0; j<count-1; j++){
			if(strcmp(arr[j].album, arr[j+1].album) > 0){
				temp = arr[j];
				arr[j] = arr[j+1];
				arr[j+1] = temp;
			}
		}
	}
	
	//Sort by Title
	for(i=0; i<count; i++){
		for(j=0; j<count-1; j++){
			if(strcmp(arr[j].album, arr[j+1].album) == 0 && strcmp(arr[j].title, arr[j+1].title) > 0){
				temp = arr[j];
				arr[j] = arr[j+1];
				arr[j+1] = temp;
			}
		}
	}
	
	printf("\n\n\t\t[VIEW by ALBUM]\n");
	for(i=0; i<count; i++){
		if(ctr==0){
			printf("\n\n\t\t|%s|\n", arr[i].album);
		}
		if(strcmp(arr[i].album, arr[i+1].album) != 0){
			ctr=0;
		}else{
			ctr++;
		}	
		printf("\t\t------------------------------------\n");		
		printf("\t\t    %s\n", arr[i].title);
		printf("\t\t------------------------------------\n");	
	}
}

int printMenu(int status){
	int choice;
	printf("\n\n\t\t================MENU================\n");
	printf("\t\t| [1] Add Music to Library         |\n");
	printf("\t\t| [2] Delete Music from Library    |\n");
	printf("\t\t| [3] View                         |\n");
	printf("\t\t| [4] Go to Now Playing            |\n");
	if (status == 0){
		printf("\t\t| [5] Turn ON Shuffle              |\n");
	}else if (status == 1){
		printf("\t\t| [5] Turn OFF Shuffle             |\n");	
	}
	printf("\t\t|                                  |\n");
	printf("\t\t| [0] Exit                         |\n");
	printf("\t\t====================================\n");
	printf("\t\tEnter Choice: "); //Input
	scanf("%d", &choice);
	return choice;		
}

int addMusic(Node **head, Node **tail, int count){
	Node *newNode, *ptr;
	newNode = initNode(&newNode);
	
	//INPUT
	printf("\n\n\t\t[INPUT]");
	printf("\n\t\t|Enter Music Title: ");
	getchar();
	fgets((newNode->music).title, 50, stdin);
	chop((newNode->music).title);
	printf("\n\t\t|Enter Music Artist: ");
	fgets((newNode->music).artist, 50, stdin);
	chop((newNode->music).artist);
	printf("\n\t\t|Enter Music Album: ");
	fgets((newNode->music).album, 50, stdin);
	chop((newNode->music).album);
	strcpy((newNode->music).genre, pickGenre());
	printf("\n\t\t|Enter Music Length: ");
	scanf("%d", &(newNode->music).length);
	
	//Node Placement
	newNode->next = *tail;
	newNode->prev = (*tail)->prev;
	(*tail)->prev->next = newNode;
	(*tail)->prev = newNode;
	newNode = NULL;
	
	printf("\n\t\t\tMUSIC ADDED..\n");
	return ++count;
}

char* pickGenre(){
	int choice;
	char *genre;
	do{
		printf("\n\t\t|Choose Genre: ");
		printf("\n\t\t    [1] Pop");
		printf("\n\t\t    [2] OPM");
		printf("\n\t\t    [3] Rock");
		printf("\n\t\t    [4] R&B");
		printf("\n\t\t    [5] Acoustic");
		printf("\n\t\t    [6] Classical");
		printf("\n\t\t|Enter Choice: ");
		scanf("%d", &choice);
		
		switch(choice){
			case 1: genre = "Pop";
			break;
			case 2: genre = "OPM";
			break;
			case 3: genre = "Rock";
			break;
			case 4: genre = "R&B";
			break;
			case 5: genre = "Acoustic";
			break;
			case 6: genre = "Classical";
			break;
			default:
				printf("\n\t\t\tINVALID INPUT..\n\n");
			break;
		}
	}while(choice!=1&&choice!=2&&choice!=3&&choice!=4&&choice!=5&&choice!=5&&choice!=6);
	
	return genre;
}

void viewMusic(Node **head, Node**tail, int count){
	int i, choice;
	Music *musicArr;
	Node *ptr;
	
	musicArr = (Music*) malloc(sizeof(Music)*count);
	ptr = (*head)->next;
	
	if((*head)->next==(*tail)){
		printf("\n\t\t[ERROR]\n\t\t\tLIBRARY IS EMPTY..\n");
	}else{
		for(i=0; i<count; i++){//Copy Linked list to an array
		musicArr[i] = ptr->music;
		ptr=ptr->next;
		}
		do{
			choice = printView();
			switch(choice){
				case 1: //View by Title
					viewByTitle(musicArr, count);
				break;
				case 2: //View by Artist
					viewByArtist(musicArr, count);
				break;
				case 3: //View by Album
					viewByAlbum(musicArr, count);
				break;
			}
		}while(choice!=0);
	}
	
	
}

void nowPlaying(Node **head, Node **tail, int count, int shuffle){	
	Node *temp;
	int timer;
	int choice, random, i;
	
	if((*head)->next==(*tail)){
		printf("\n\t\t[ERROR]\n\t\t\tLIBRARY IS EMPTY..\n");
	} 
	else{	
		temp = (*head)->next;
		 printDetailStart(temp);
		 scanf("%d", &choice);
        while(choice!=0){
        	if(shuffle == 0){ //Shuffle is OFF
				switch(choice){				
					case 1: 
						if((temp!=(*head)->next)){
							temp = temp->prev;
							printDetail(temp);
						}
						else{
							printDetailStart(temp);
						}
						break;
							
					case 2:
						if((*tail)->prev!=temp){
							temp = temp->next;
							printDetail(temp);
						}
						else{
							printf("\n\n\n\t\t[NOW PLAYING]\n");
							printf("\n\t\t\t    END OF PLAYLIST\n\n\t\t| << [1] Previous                  |\n\t\t|\t  [0] Back to MENU         |\n\n\t\t Choice: ");	
						}
						break;
				}
		    	scanf("%d", &choice);
			}
			else if(shuffle == 1){//Shuffle is ON
				switch(choice){
					case 1:
						if(random!=0){
							random--;
						}
						temp = (*head)->next;
						for(i=0;i<random;i++){
							temp = temp->next;
						}
						if(random==0){
							printDetailStart(temp);
						}else{
							printDetail(temp);
						}
					break;
					case 2:
						temp = (*head)->next;
						srand(time(NULL));
						random = rand()%count;
						for(i=0;i<random;i++){
							temp = temp->next;
						}
						printDetail(temp);
					break;	
				}
				scanf("%d",&choice);	
			}
		}
	}
}

int deleteMusic(Node **head, Node **tail, int count){ //Under Construction
	Node *ptr, *ptr1;
	char toDelete[50];
	int choice, temp=0;
	
	if(((*head)->next)==(*tail)){ //If there is still no element, then error
		printf("\n\t\t[ERROR]\n\t\t\tNO MUSIC TO DELETE..\n");
		return count;
	}else{ //If there is already an element
		do{
			printf("\n\n\t\t[DELETE METHOD]");
			printf("\n\t\t\t[1] Delete by Title");
			printf("\n\t\t\t[2] Delete by Artist");
			printf("\n\n\t\t|Enter Choice: ");
			scanf("%d", &choice);
		}while(choice!=1&&choice!=2);
		
		if(choice==1){//Delete by Title
			printf("\n\n\t\t[DELETE]");
			printf("\n\t\t|Enter Music Title: ");
			getchar();
			fgets(toDelete, 50, stdin);
			chop(toDelete);
			
			//Loop till element is found
			ptr = (*head)->next;
			while((ptr)!=(*tail)){
				if(strcmp(((ptr->music).title), toDelete)==0){ //De allocate that element
					ptr->prev->next = ptr->next;
					ptr->next->prev = ptr->prev;
					free(ptr);
					printf("\n\t\t\tMUSIC DELETED..\n");
					return --count;
				}
				ptr = ptr->next;
			}
			printf("\n\t\t[ERROR]\n\t\t\tMUSIC NOT FOUND..\n"); //Display element not found
			return count;
		}else{//Delete by Artist
			printf("\n\n\t\t[DELETE]");
			printf("\n\t\t|Enter Music Artist: ");
			getchar();
			fgets(toDelete, 50, stdin);
			chop(toDelete);
			
			//Loop till element is found
			ptr = (*head)->next;
			while((ptr)!=(*tail)){
				if(strcmp(((ptr->music).artist), toDelete)==0){ //De allocate that element
					ptr->prev->next = ptr->next;
					ptr->next->prev = ptr->prev;
					free(ptr);
					temp++;
				}
				ptr = ptr->next;
			}
			if(temp==0){
				printf("\n\t\t[ERROR]\n\t\t\tARTIST NOT FOUND..\n");
			}else{
				printf("\n\t\t\t%d MUSIC/S DELETED..\n", temp);
				return (count - temp);
			}
			return(count);		
		}
		
	}	
}

void saveLibrary(Node **head, Node **tail, int count){
	Node *ptr;
	FILE *fp;
	
	ptr = (*head)->next;
	fp = fopen("library.txt", "w");
    fprintf(fp, "%d\n", count);
	while (ptr != (*tail)){
	    fprintf(fp, "Title:%s|Artist:%s|Album:%s|Genre:%s|Length:%d\n", ptr->music.title, ptr->music.artist, ptr->music.album, ptr->music.genre, ptr->music.length);
		ptr = ptr->next;
	}
	fclose(fp);
	printf("\n\t\t[INFO]\n\t\t\tLIBRARY SAVED..\n");	
}

Node* loadLibrary(Node **head, Node **tail, int *count){
	Node *newNode;
	FILE *fp;
	char c, line[1000];
	
	fp = fopen("library.txt", "r");
	
	if((fp)==NULL){
		printf("\n\t\t[INFO]\n\t\t\tLIBRARY NOT FOUND..\n");
	}else{
		fscanf(fp, "%d\n", count);
		printf("\n\t\t[INFO]\n\t\t\t%d SONGS LOADED..\n", *count);
		while (!feof(fp)){
			newNode = initNode(&newNode);
			c = getc(fp);
			if(c==EOF){
				break;
			}	
			ungetc(c, fp);
			
			fgets(line, sizeof(line), fp);
			sscanf(line, "Title:%[^|]|Artist:%[^|]|Album:%[^|]|Genre:%[^|]|Length:%d\n", newNode->music.title, newNode->music.artist, newNode->music.album, newNode->music.genre, &(newNode->music.length));
			
			//Node Placement
			newNode->next = *tail;
			newNode->prev = (*tail)->prev;
			(*tail)->prev->next = newNode;
			(*tail)->prev = newNode;
			newNode = NULL;
		}
	}
	fclose(fp);  
	return (*head);
}

void deAlloc(Node **head, Node **tail){
	Node *ptr1, *ptr2;
	ptr1 = (*head)->next;
	ptr2 = ptr1->next;
	
	if((*head)->next==(*tail)){
		printf("\n\t\t\tThank You!\n");
		return;
	}else{
		while(ptr1!=(*tail)){
			free(ptr1);
			ptr1 = ptr2;
			if(ptr2!=(*tail)){
				ptr2 = ptr2->next;
			}
		}
	}
	(*head)->prev = (*tail)->next = NULL;
	(*head)->next = (*tail);
	(*tail)->prev = (*head); 
}