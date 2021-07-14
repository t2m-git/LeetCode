class Solution:
    def plusOne(self, digits: List[int]) -> List[int]:
        """
        :type digits: List[int]
        :rtype: List[int]
        """
        """
        carry = 1
        for i in reversed(range(len(digits))):
            carry, digits[i] = divmod(digits[i]+carry, 10)

        if carry > 0:
            return [carry] + digits
        else:
            return digits
        """
        
        l = digits[::-1]
        l[0] += 1
        carry = 0
        
        for i in range(len(l)):
            if l[i] > 9:
                l[i] -= 10
                carry = 1

                if i != len(l) - 1:
                    l[i + 1] += 1
                else:
                    l.append(carry)
        return l[::-1]
