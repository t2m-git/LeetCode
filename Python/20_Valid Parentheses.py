class Solution:
    def isValid(self, s: str) -> bool: 
        """
        :type s: str
        :rtype: bool
        """
        dict = {")": "(", "]":"[", "}":"{"}
        stack = []
        for ch in s:
            if ch in ["(", "[", "{"]:
                stack.append(ch)
            else:
                if not stack:
                    return False
                elif dict[ch] == stack[-1]:
                    stack.pop()
                else:
                    return False
                
        return len(stack) == 0
