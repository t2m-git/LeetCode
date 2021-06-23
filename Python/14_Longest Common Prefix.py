class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        """
        :type strs: List[str]
        :rtype: str
        """

        if not strs:
            return ""
        
        # get character lengths from a list
        lst_lens = [len(i) for i in strs]
        num_min = min(lst_lens)
        ind_shortest = lst_lens.index(num_min)
        
        # get the shortest charactor
        str_shortest = strs[ind_shortest]
        
        strs.sort()

        for i in range(len(str_shortest)):
            if (strs[0][i] != strs[-1][i]):
                return str_shortest[:i]
            
        return str_shortest
