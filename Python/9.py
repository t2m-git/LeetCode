class Solution:
    def isPalindrome(self, x: int) -> bool:
        
        #original
        str_x = str(x)
        
        #reverse
        str_y = str_x[::-1]
            
        return True if (str_x == str_y) else False 
