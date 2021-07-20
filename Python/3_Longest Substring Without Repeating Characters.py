class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        """
        :type s: str
        :rtype: int
        """
        """
        # This solution has a problem in performance
        def check(start, end):
            chars = [0] * 128
            for i in range(start, end + 1):
                c = s[i]
                chars[ord(c)] += 1
                if chars[ord(c)] > 1:
                    return False
            return True

        n = len(s)
        ans = 0
        
        for i in range(n):
            for j in range(i, n):
                if check(i, j):
                    ans = max(ans, j - i + 1)
        return ans
        """
        
        left, right = 0, 0
        dic = dict()
        res = 0
        while right < len(s):
            if s[right] in dic:
                left = max(left, dic[s[right]] + 1)
            dic[s[right]] = right
            res = max(res, right - left + 1)
            right += 1
        return res
