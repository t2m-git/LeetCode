class Solution:
    def isPalindrome(self, x: int) -> bool:
        
        #original
        str_x = str(x)
        
        #reverse
        str_y = str_x[::-1]
        
        
        
        while x > 0:
            x, tmp = divmod(x, 10)
            reverse = reverse * 10 + tmp
            
        return True if (str_x == str_y) else False 
