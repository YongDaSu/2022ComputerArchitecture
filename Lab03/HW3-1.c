/*** Leetcode 19. Remove Nth Node From End of List ***/ 

#include<stdio.h>
#include<stdlib.h>
struct ListNode {
	int val;
	struct ListNode *next;
};
typedef struct ListNode Node;

void add_node(Node **start, int value);
void print_list(Node *node);
void free_list(Node *node);

struct ListNode* removeNthFromEnd(Node *node, int n){
    int i=0;
    int j;
    struct ListNode *cur;
    cur = node;
    while(cur != NULL){
        i++; 
        cur = cur->next;
    }
    //printf("i = %d", i);
    //special condition
    //1.i=1
    if(i == 1){
    	node = NULL;
    	return node;
    }
    //2.if n = i (means delete first node)
    if(i == n){
        node = node->next;
        return node;
    }
    
    //loop until meet the delete target
    cur = node;
    for(j=0;j<i-n-1;j++){
        cur = cur->next;
    }
    //skip the target
    cur->next = cur->next->next;
    return node;
}



int main(int argc, char* argv[])
{
	// create first list
	Node *head = NULL;
	add_node(&head, 1);
	add_node(&head, 2);
	add_node(&head, 3);
	add_node(&head, 4);
	add_node(&head, 5);

	printf("\noriginal list = ");
	print_list(head);
	printf("delete 2 node from end.");
	//removeNthFromEnd(head,2);
	printf("\nresult = ");
	print_list(removeNthFromEnd(head,2));
	free_list(head);
	
	//create second list
	Node *head2 = NULL;
	add_node(&head2, 1);

	printf("\noriginal list = ");
	print_list(head2);
	printf("delete 1 node from end.");
	//removeNthFromEnd(head2,1);
	printf("\nresult = ");
	print_list(removeNthFromEnd(head2,1));
	free_list(head2);
	
	//create third list
	Node *head3 = NULL;
	add_node(&head3, 1);
	add_node(&head3, 2);
	add_node(&head3, 3);
	add_node(&head3, 4);
	add_node(&head3, 5);
	add_node(&head3, 6);

	printf("\noriginal list = ");
	print_list(head3);
	printf("delete 6 node from end.");
	//removeNthFromEnd(head3,6);
	printf("\nresult = ");
	print_list(removeNthFromEnd(head3,6));
	free_list(head3);
	
	return 0;	
}

void add_node(Node **start, int value)
{
	Node *new_node = (Node*)malloc(sizeof(Node));
	new_node->val = value;
	new_node->next = NULL;
	
	if(*start == NULL) {
		*start = new_node;
		return;
	}
	else {
		Node *cur;	
		cur = *start;
		while(cur->next != NULL) {
			cur = cur->next;
		}
		cur->next = new_node;
		return;
	}
}

void print_list(Node *node)
{
	if (node == NULL){
		printf("NULL");
	}
	while(node != NULL) {
		printf("%d ", node->val); 
		node = node->next;
	}
	printf("\n");
}

void free_list(Node *node)
{
	Node *cur, *tmp;
	cur = node;
	while(cur != NULL) {
		tmp = cur;
		cur = cur->next;
		free(tmp);
	}
}

/* Code part in leetcode 
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };


struct ListNode* removeNthFromEnd(struct ListNode* head, int n){
    int i=0;
    int j;
    struct ListNode *cur;
    cur = head;
    while(cur != NULL){
        i++; 
        cur = cur->next;
    }
    //special condition
    //1.i=1
    if(i == 1){
        return NULL;
    }
    //2.if n = i (means delete first node)
    if(i == n){
        head = head->next;
        return head;
    }
    
    //loop until meet the delete target
    cur = head;
    for(j=0;j<i-n-1;j++){
        cur = cur->next;
    }
    //skip the target
    cur->next = cur->next->next;
    return head ;
}
*/
