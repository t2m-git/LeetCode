class Solution:
    def lengthOfLastWord(self, s: str) -> int:
        """
        :type s: str
        :rtype: int
        """
        
        s = s.strip()
        lst_word = s.split(' ')
                
        if s == " ":
            return 0
        
        else:
            return len(lst_word[-1])
