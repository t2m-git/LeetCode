class Solution:
    def lengthOfLastWord(self, s: str) -> int:
        """
        :type s: str
        :rtype: int
        """
        """
        #Solution 1 
        s = s.strip()
        lst_words = s.split(' ')
                
        if s == " ":
            return 0
        
        else:
            return len(lst_words[-1])
        """
        
        """
        #Solution 2
        try:
            return len(s.split()[-1])
        
        except IndexError:
            return 0
        """
        
        #Solution 3
        
        cnt = 0
        for i in range(len(s) - 1, -1, -1):
          
            if s[i] != " ":
                while i >= 0 and s[i] != " ":
                    cnt += 1
                    i -= 1
                break
        
        return cnt
