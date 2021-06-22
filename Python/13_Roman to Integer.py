class Solution:
    def romanToInt(self, s: str) -> int:
        """
        :type s: str
        :rtype: int
        """
        dict = {"I":1, "V": 5, "X":10, "L":50, "C":100, "D":500, "M":1000}
        ans = 0
        pre_value = None
        
        for num in s:
            if (num in ["V", "X"] and pre_value == 1) or \
               (num in ["L", "C"] and pre_value == 10) or \
               (num in ["D", "M"] and pre_value == 100):
                
                ans += dict[num] - 2 * pre_value 
            
            else:
                ans += dict[num]
                pre_value = dict[num]
        
        return ans
