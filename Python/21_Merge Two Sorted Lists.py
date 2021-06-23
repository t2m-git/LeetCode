# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def mergeTwoLists(self, l1: ListNode, l2: ListNode) -> ListNode:
        
        if(l1 == None): return l2
        if(l2 == None): return l1
        
        # Initial
        if(l1.val > l2.val):
            l1, l2 = l2, l1
        
        resHead = l1
        while(l1 != None and l2 != None):
                tmp = None
                while(l1 != None and l1.val <= l2.val):
                    tmp = l1
                    l1 = l1.next
                
                tmp.next = l2
                
                l1, l2 = l2, l1
        
        return resHead
