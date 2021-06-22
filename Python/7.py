class Solution:
    def reverse(self, x: int) -> int:
        
        lst_reverse = []
        lst_reverse = str(x)[::-1]

        if lst_reverse[-1] == '-':
            lst_reverse = lst_reverse[-1] + lst_reverse[0:-1]

        x = int(lst_reverse)
        
        ##if (x <= 2**31 -1) & (x >= -2**31):
        ##
        ##    return x
        ##
        ##else:
        ##    
        ##    return 0
        
        return x if (x <= 2**31 -1) & (x >= -2**31) else 0
