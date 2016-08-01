---
layout: post
title:  "Detect circular linked list"
date:   2016-07-31 00:18:23 +0700
categories: [java]
---
Detect whether a given linked list is a circular. If so, compute the cycle length.

{% highlight cpp %}
#include "linked_list.h"
#include <iostream>
using namespace std;

bool isCircular(Node<int> *head)
{
    Node<int> *slow=head, *fast=head;
    while(fast && fast->next){
        slow = slow->next;
        fast = fast->next->next;
        if (slow==fast) 
            return true;
    }
    return false;
}

Node<int>* cycleStart(Node<int> *head){
    Node<int> *slow=head, *fast=head, *meet;
    while(fast && fast->next){
        slow = slow->next;
        fast = fast->next->next;
        if (slow==fast){
                meet = slow;
        break;
        }
    }
    slow=head;
    while(slow!=meet){
        slow = slow->next;
        meet = meet->next;
    }
    return meet;
}

int cycleLength(Node<int> *start) {
    int len=1;
    Node<int> *p=start;
    while(p->next!=start) {++len; p=p->next;}
    return len;
}

int main()
{
    // construct linkedlist
    Node<int> *head = new Node<int>;
    head->data = 1;
    head->next = NULL;
    Node<int> *tail = head;
    int k;
    for (k=2; k<=11; k++) {
        Node<int> *tmp = new Node<int>;
        tmp->data = k;
        if (k==11)
            tmp->next = head->next->next->next;
        else
            tmp->next = NULL;
        tail->next = tmp;
        tail = tmp;
    }

    // cycle detection
    if (isCircular(head))
        cout<<"cyclic list!"<<endl;
    else
        cout<<"acyclic list!"<<endl;

    // find cycle start
    Node<int> *start;
    if (isCircular(head)){
        start = cycleStart(head);
        cout<<start->data<<endl;
    }

    // find cycle length
    if (isCircular(head))
        cout<<cycleLength(start)<<endl;
}
{% endhighlight %}
